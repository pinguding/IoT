#include "iot.h"

using namespace std;

int zNum;

void run(subject &SUB, string datatype)
{
    if(datatype == "BVP") {
        SUB.ppg_data.run();
    }
    else if(datatype == "GSR") {
        SUB.gsr_data.run();
    }
    else if(datatype == "ACC") {
        SUB.acc_data.run();
    }
    else {
        cerr << "Wrong Data Type (2)" << endl;
        exit(1);
    }
}

void ppg::run()
{
	BPF(0.5,11,data);
	BPF(0.8,3,BPF_data);
	BPF(1.0,1.6,BPF_data);
	find_peak(BPF_data,num_data);
	ofstream ofile, ofile_LFHF;
	ofile.open("power.plot");
	ofile_LFHF.open("./db/LFHF.db",ios::app);
	arOrder = HRV_size - 1;
	d = new double[arOrder];
	for(int i=0; i<arOrder; i++)
		d[i] = 0;
	XMS = 0.00;
	memcof(HRV,HRV_size,arOrder,XMS,d);
	map<double,double> freq_result;
	double samp_inter = calc_ibi_sampling_interval();
	for(double i=0.00; i<0.50; i+=0.01) {
		double fdt = i * samp_inter;
		freq_result[fdt] = 10 * log10(10 + evlmem(fdt,d,arOrder,XMS));
		ofile << fdt << " " << freq_result[fdt] << endl;
	}
	ULF_power = 0.00;
	for(double i=0.00; i<=0.05; i+=0.01)
		ULF_power += freq_result[i * samp_inter];
	LF_power = 0.00;
	for(double i=0.05; i<=0.15; i+=0.01)
		LF_power += freq_result[i * samp_inter];
	if(isnan(LF_power))
		exit(1);
	HF_power = 0.00;
	for(double i=0.15; i<=0.4; i+=0.01)
		HF_power += freq_result[i * samp_inter];
	ofile_LFHF << LF_power/HF_power << endl;
	delete [] d;
}


double ppg::report_result()
{
	return LF_power/HF_power;
}

void gsr::run()
{
    ofstream ofile_gsr;
    ofile_gsr.open("./db/gsr.db",ios::app);
    
	double *zGSR = new double[num_data];
    double std = 0.0, mean = 0.0, nData = num_data;
    
	for(int i=0; i<num_data; i++)
        mean += data[i];
    
	mean = mean/nData;
    
	for(int i=0; i<num_data; i++)
        std += (data[i] - mean) * (data[i] - mean);
    
	std = std / nData;
	
	for(int i=0; i<num_data; i++)
		zGSR[i] = 0;
	
	for(int i=0; i<num_data; i++)
		zGSR[i] = (data[i] - mean)/std;
	
	int down_sample = num_data/gsr_sampling_rate;
	double *downGSR = new double[down_sample];
	
	for(int i=0; i<down_sample; i++)
		downGSR[i] = 0;
	
	int origin_idx = 0;
	int count = 0;
	for(int i=0; i<down_sample; i++)
	{
		for(int j=0; j<gsr_sampling_rate; j++)
		{
			downGSR[i] += zGSR[origin_idx];
			origin_idx++;
		}
		downGSR[i] = downGSR[i] / gsr_sampling_rate;	
		if(downGSR[i] > 0) count++;
	}
	
	ofile_gsr << (double)count / down_sample << endl;
	
	delete [] zGSR;
	delete [] downGSR;
}

void acc::run()
{
    ofstream ofile_absACC;
    
    ofile_absACC.open("./db/ACC.db",ios::app);
    
    //ofile_dACC.open("./db/dACC.db");

    double *absACC = new double[num_data];
	
	for(int i=0; i<num_data; i++)
		absACC[i] = 0;
    
	double add_result = 0.0;
    
	for(int i=0; i<num_data; i++)
    {
        absACC[i] = sqrt((x_data[i] * x_data[i] + y_data[i] * y_data[i] + z_data[i] * z_data[i])/3);
        add_result += absACC[i];
    }
	double acc_mean = add_result / num_data;
	zNum = num_data/acc_sampling_rate;
	
	double *zACC = new double[zNum];
	
	for(int i=0; i<zNum; i++)
		zACC[i] = 0;	
	int zidx = 0;
	double calc_result = 0.0;	
	for(int i=0; i<zNum; i++)
	{
		for(int j=0; j<acc_sampling_rate; j++)
		{
			zACC[i] += absACC[zidx]; 
			zidx++;
		}
		zACC[i] = zACC[i] / (acc_sampling_rate * 255);
		calc_result += zACC[i];
	}
	
	calc_result = calc_result / zNum;
		
	ofile_absACC << calc_result << endl;
	
	delete [] zACC;
}

