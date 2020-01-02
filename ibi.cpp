#include "iot.h"

using namespace std;


void ppg::calc_HRV(vector< pair<int,int> > IBI)
{
	int minWinSize = 0.5 * ppg_sampling_rate;
	int maxWinSize = 1.5 * ppg_sampling_rate;

	HRV = new double[IBI.size() - 1];
	HRV_size = IBI.size() - 1;
	mean_HR = 0.0;
	//ofstream ofile_hrv;
	//ofile_hrv.open("./hrv.db");
	for(int i=0; i < IBI.size()-1; i++) {
		HRV[i] = (IBI[i+1].first - IBI[i].first);
		cout << "HRV[" << i << "] = " << HRV[i] << endl;
		//ofile_hrv << i << " " << HRV[i] << endl;
		mean_HR += HRV[i];
	}
	mean_HR = mean_HR / ((double)IBI.size()-1);
	cout << "********************************************************" << endl;
	cout << "Total beat : " << (IBI.size()-1) * 2 << "BPM" << endl;	
	cout << "Mean  HR   : " << mean_HR << endl;
	
	SDNN = 0.0;

	for(int i=0; i < IBI.size()-1; i++)
	{
		SDNN += pow((IBI[i+1].first - IBI[i].first) - mean_HR, 2);
	}
	SDNN = sqrt(SDNN/((double)IBI.size() - 2));
	RMSSD = 0.0;
	for(int i=0; i < IBI.size()-1; i++)
	{
		RMSSD += pow((IBI[i+1].first - IBI[i].first), 2);
	}
	RMSSD = sqrt(RMSSD/((double)IBI.size() - 2));
	
	//ofstream ofile_sdnn, ofile_rmssd, ofile_totalBeat, ofile_meanHR;
	
	//ofile_sdnn.open("./SDNN.db",ios::app);
	//ofile_rmssd.open("./RMSSD.db",ios::app);
	//ofile_totalBeat.open("./Total_Beat.db",ios::app);
	//ofile_meanHR.open("./Mean_HR.db",ios::app);

	cout << "SDNN       : " << SDNN << endl;
	//ofile_sdnn << SDNN << endl;
	cout << "RMSSD      : " << RMSSD << endl;
	//ofile_rmssd << RMSSD << endl;
	cout << "1/RMSSD : " << 1/RMSSD << endl;
	//ofile_totalBeat << (IBI.size() -1) * 2 << endl;
	//ofile_meanHR << mean_HR << endl;
	cout << "********************************************************" << endl;
}

void ppg::find_peak(double *input_data, int data_size)
{
	int minWinSize = 0.5 * ppg_sampling_rate;
	int maxWinSize = 1.5 * ppg_sampling_rate;
	vector< pair<int,int> > IBI;
	for(int i=1; i<data_size-1; i++)
	{
		if(input_data[i] - input_data[i-1] > 0 && input_data[i] - input_data[i+1] < 0)
		{
			pair<int,int> ibi_candi;
			ibi_candi.first = i;
			ibi_candi.second = input_data[i];
			if(IBI.size() == 0)
				IBI.push_back(ibi_candi);
			else if((ibi_candi.first - IBI.back().first) > minWinSize)
				IBI.push_back(ibi_candi);
		}
	}
	calc_HRV(IBI);	
}

