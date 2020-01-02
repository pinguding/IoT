#include "iot.h"
#include <cstdio>

using namespace std;

string SUBNUM = "";
string SUBDAY = "";

int main()
{
	int subs = 8;
	int sub_num[8] = {1,2,4,5,6,7,8,9};
	int total_runtime = 0;
	ofstream Final_Result;
	Final_Result.open("./db/Final_Result.db");
	string prev_day = "1";
	cout << "Start Program" << endl;
	for(int s = 0; s < subs; s++)
	{
		cout << "SUB[" << s+1 << "] is now analyzing..." << endl;
		string file_name = "data_info";
		string file_num  = to_string(sub_num[s]);
		string file_format = ".txt";
		file_name = file_name + file_num + file_format;
		string line;
		ifstream dInfo;
		dInfo.open(file_name);
		while(getline(dInfo,line))
		{
			clock_t begin,end;
			begin = clock();
			subject sub;
			parsing(sub,line);
			size_t FFF1  = line.find("sub");
			size_t FFF2  = line.find("day");
			size_t sizet = line.find_last_of("/");
			string datatype = line.substr(sizet-3,3);
			SUBNUM = line.substr(FFF1+3,1);
			SUBDAY = line.substr(FFF2+3,1);
			if(prev_day != SUBDAY)
			{
				string takedata;
				ifstream dataACC, dataGSR, dataBVP;
				
				dataACC.open("./db/ACC.db");
				dataGSR.open("./db/gsr.db");
				dataBVP.open("./db/LFHF.db");
				
				double DATA;
				double MEANDATA = 0.0;
				double COUNT = 0.0;
				while(dataACC >> DATA)
				{
					MEANDATA += DATA;
					COUNT += 1.0;
				}
				MEANDATA = MEANDATA / COUNT;
				Final_Result << MEANDATA << " ";
				
				MEANDATA = COUNT = 0.0;
				while(dataBVP >> DATA)
				{
					MEANDATA += DATA;
					COUNT += 1.0;
				}
				MEANDATA = MEANDATA / COUNT;
				Final_Result << MEANDATA << " ";

				MEANDATA = COUNT = 0.0;
				while(dataGSR >> DATA)
				{
					MEANDATA += DATA;
					COUNT += 1.0;
				}
				MEANDATA = MEANDATA / COUNT;
				Final_Result << MEANDATA << endl;
			
				dataACC.close();
				dataGSR.close();
				dataBVP.close();

				remove("./db/ACC.db");
				remove("./db/gsr.db");
				remove("./db/LFHF.db");
				prev_day = SUBDAY;
			}
			
			run(sub, datatype);

			end = clock(); 
			//cout << "SUB" << SUBNUM << ", " << "DAY" << SUBDAY << " : " << datatype << endl; 
			//cout << "Runtime Check : " << ((end-begin)/(CLOCKS_PER_SEC/1000)) << "ms" << endl; 
			total_runtime += ((end-begin)/(CLOCKS_PER_SEC/1000));
		}
	}
	string takedata;
	ifstream dataACC, dataGSR, dataBVP;

	dataACC.open("./db/ACC.db");
	dataGSR.open("./db/gsr.db");
	dataBVP.open("./db/LFHF.db");

	double DATA;
	double MEANDATA = 0.0;
	double COUNT = 0.0;
	while(dataACC >> DATA)
	{
		MEANDATA += DATA;
		COUNT += 1.0;
	}
	MEANDATA = MEANDATA / COUNT;
	Final_Result << MEANDATA << " ";

	MEANDATA = COUNT = 0.0;
	while(dataBVP >> DATA)
	{
		MEANDATA += DATA;
		COUNT += 1.0;
	}
	MEANDATA = MEANDATA / COUNT;
	Final_Result << MEANDATA << " ";

	MEANDATA = COUNT = 0.0;
	while(dataGSR >> DATA)
	{
		MEANDATA += DATA;
		COUNT += 1.0;
	}
	MEANDATA = MEANDATA / COUNT;
	Final_Result << MEANDATA << endl;

	dataACC.close();
	dataGSR.close();
	dataBVP.close();

	remove("./db/ACC.db");
	remove("./db/gsr.db");
	remove("./db/LFHF.db");

	ifstream read_result,response;
	read_result.open("./db/Final_Result.db");
	response.open("./response.txt");
	double result_data[8][7];
	double Response[8][7];
	for(int i = 0; i < 7; i++)
	{
		for(int j = 0; j < 8; j++)
		{
			double resultacc, resultbvp, resultgsr,res;
			read_result >> resultacc;
			read_result >> resultbvp;
			read_result >> resultgsr;
			result_data[j][i] = 0.5 * (resultgsr/resultacc) + 0.5 * resultbvp;
			response >> res;
			Response[j][i] = res;
		}
	}

	double alpha = 0.1;
	int iterations = 1500;
	double MeanAcc = 0.0;	
	for(int i=0; i<8; i++)
	{
		LinearRegression lr(result_data[i], Response[i], 8);
		lr.train(alpha, iterations);
		double acc = 0.0;
		for(int j=0; j<7; j++)
		{
			acc += 100 - (abs(result_data[i][j] * lr.theta[1] + lr.theta[0] - Response[i][j]) / 40 * 100);
			cout << "SUB[" << i+1 << "]" << " Day[" << j+1 << "] : " << "Response PSS = " << Response[i][j] << ", Predict Result : " << abs(result_data[i][j]) * lr.theta[1] + lr.theta[0] << endl;
		}
		acc = acc / 7;
		MeanAcc += acc;
		cout << "SUB[" << i+1 << "]" << " accuracy : " << acc << "%" << endl;
	}
	cout << "Avearage Stress Predict Algorithm Accuracy : " << MeanAcc/8 << "%" << endl;

	cout << "Total Runtime : " << total_runtime/1000 << " sec" << endl;
	//double result = subject.ppg_data.;
	//double return_val = sub.ppg_data.report_result() * 100;
	return 0;
}
