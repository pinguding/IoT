#include "iot.h"

using namespace std;

void parsing(subject &SUB, string argv)
{
	ifstream ifile;
	if(argv == "")
	{
		cerr << "Input Argument Error, please insert correct input file path" << endl;
		exit(1);
	}

	string file_name = argv;

	size_t sizet = file_name.find_last_of("/");
	string datatype = file_name.substr(sizet-3,3);

	ifile.open(file_name);
	
	if(!ifile.good()) {
		cerr << "Wrong Input" << endl;
		exit(1);
	}
	getline(ifile, SUB.std_id);
	getline(ifile, SUB.device_id);
	
	//cout << SUB.std_id << endl;
	//cout << SUB.device_id << endl;
	SUB.time_section = 0; //This condition is just for the pre-test code//
	vector<double> ppgs, gsrs, xacc, yacc, zacc;
	if(datatype == "BVP")
	{
		string line;
		while(getline(ifile,line))
		{
			size_t pos = line.find_first_of(",");
			string Data = line.substr(0,pos);
			double ppg = atof(line.c_str());
			ppgs.push_back(ppg);
		}
		SUB.ppg_data.get_ppg_data(ppgs);
		ppgs.clear();
	}
	else if(datatype == "GSR")
	{
		string line;
		while(getline(ifile,line))
		{
			size_t pos = line.find_first_of(",");
			string Data = line.substr(0,pos);
			double gsr = atof(line.c_str());
			gsrs.push_back(gsr);
        }
		//gsrs.pop_back();
		SUB.gsr_data.get_gsr_data(gsrs);
		gsrs.clear();
	}
	else if(datatype == "ACC")
	{
		string line;
		while(getline(ifile,line))
		{
			size_t pos1 = line.find_first_of(",");
			string xData = line.substr(0,pos1);
			string subData1 = line.substr(pos1+2);
			
			size_t pos2 = subData1.find_first_of(",");
			string yData = subData1.substr(0,pos2);
			string subData2 = subData1.substr(pos2+2);
			
			size_t pos3 = subData2.find_first_of(",");
			string zData = subData2.substr(0,pos3);
			
			double xdata = atof(xData.c_str());
			double ydata = atof(yData.c_str());
			double zdata = atof(zData.c_str());
				
			xacc.push_back(xdata);
            yacc.push_back(ydata);
            zacc.push_back(zdata);

		}
		SUB.acc_data.get_acc_data(xacc,yacc,zacc);
		xacc.clear();
        yacc.clear();
        zacc.clear();
	}
	else 
	{
		cerr << "Caution :: Wrong Data Type" << endl;
		exit(1);
	}
//	cout << "END PARSING" << endl;
}

void ppg::get_ppg_data(vector<double> ppg_data_sets)
{
	data = new double[ppg_data_sets.size()];
	for(int i=0; i<ppg_data_sets.size(); i++) { 
		data[i] = ppg_data_sets[i];
		//cout << data[i] << endl;
	}
	num_data = ppg_data_sets.size();
	//cout << "num_data(2) : " << num_data << endl;
}

void gsr::get_gsr_data(vector<double> gsr_data_sets)
{
	data = new double[gsr_data_sets.size()];
	for(int i=0; i<gsr_data_sets.size(); i++)
		data[i] = gsr_data_sets[i];
	num_data = gsr_data_sets.size();
}

void acc::get_acc_data(vector<double> X_acc, vector<double> Y_acc, vector<double> Z_acc)
{
	x_data = new double[X_acc.size()];
	y_data = new double[Y_acc.size()];
	z_data = new double[Z_acc.size()];
	for(int i=0; i<X_acc.size(); i++)
	{
		x_data[i] = X_acc[i];
		y_data[i] = Y_acc[i];
		z_data[i] = Z_acc[i];
	}
	num_data = X_acc.size();
}
