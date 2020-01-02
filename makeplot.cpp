#include "iot.h"

using namespace std;

double *ppg::data_return(string type)
{
	double *D = new double[num_data];
	if(type == "origin"){
		D = data;
	}
	else if(type == "lpf"){
		D = LPF_data;
	}
	else if(type == "hpf"){
		D = HPF_data;
	}
	else if(type == "bpf"){
		D = BPF_data;
	}
	else{
		cerr << "WRONG INPUT METHOD :: error(100)" << endl;
		exit(1);
	}
	return D;
}

int ppg::size_return()
{
	int sizeOFdata = num_data;
	return sizeOFdata;
}

void ppgplot(subject &SUB, char *argv)
{
	ofstream ofile_origin, ofile_LPF, ofile_HPF, ofile_BPF;
	string filename = "./plot_file/";
	
	string argument = argv;
	
	//cout << argument << endl;
	
	size_t pos1 = argument.find_last_of("/");
	size_t pos2 = argument.find_last_of(".");
	
	//cout << pos1 << ", " << pos2 << endl;

	filename += argument.substr(pos1+1, pos2 - pos1 - 1);
	
	string origin = filename + "_origin.plot";
	string LPF	  = filename + "_LPF.plot";
	string HPF    = filename + "_HPF.plot";
	string BPF    = filename + "_BPF.plot";

	ofile_origin.open(origin);
	ofile_LPF.open(LPF);
	ofile_HPF.open(HPF);
	ofile_BPF.open(BPF);

	int size = SUB.ppg_data.size_return();
	double *ORIdataSet = SUB.ppg_data.data_return("origin");
	double *LPFdataSet = SUB.ppg_data.data_return("lpf");
	double *HPFdataSet = SUB.ppg_data.data_return("hpf");
	double *BPFdataSet = SUB.ppg_data.data_return("bpf");

	for(double i=0.0; i<size; i+=1.0)
		ofile_origin << i/64 << " " << ORIdataSet[int(i)] << endl;
	
	for(double i=0.0; i<size; i+=1.0)
		ofile_LPF << i/64 << " " << LPFdataSet[int(i)] << endl;

	for(double i=0.0; i<size; i+=1.0)
		ofile_HPF << i/64 << " " << HPFdataSet[int(i)] << endl;

	for(double i=0.0; i<size; i+=1.0)
		ofile_BPF << i/64 << " " << BPFdataSet[int(i)] << endl;

}
