#include "iot.h"

using namespace std;

void ppg::LPF(double cut_off_freq, double *input_data)
{
	double a1,b0,b1,w0;
	w0 = 2 * M_PI * cut_off_freq;
	a1 = (w0 - 2 * ppg_sampling_rate)/(2 * ppg_sampling_rate + w0);
	b0 = w0/(2*ppg_sampling_rate + w0);
	b1 = b0;
	double *lpf = new double[num_data];
	LPF_data = lpf;
	LPF_data[0] = input_data[0];
	for(int i=1; i<num_data; i++)
		LPF_data[i] = b0 * input_data[i] + b1 * input_data[i-1] - a1 * LPF_data[i-1];
}

void ppg::BPF(double Lcut_off_freq, double Hcut_off_freq, double *input_data)
{
	LPF(Hcut_off_freq,input_data);
	HPF(Lcut_off_freq,LPF_data);
	BPF_data = HPF_data;
}

void ppg::HPF(double cut_off_freq, double *input_data)
{
	double a1,b0,b1,w0;
	w0 = 2 * M_PI * cut_off_freq;
	a1 = (w0 - 2 * ppg_sampling_rate)/(2 * ppg_sampling_rate + w0);
	b0 = 2*ppg_sampling_rate/(2*ppg_sampling_rate + w0);
	b1 = b0;
	double *hpf = new double[num_data];	
	HPF_data = hpf;
	HPF_data[0] = input_data[0];
	for(int i=1; i<num_data; i++)
		HPF_data[i] = b0 * input_data[i] - b1 * input_data[i-1] - a1 * HPF_data[i-1];
}

void ppg::testing()
{
	
	LPF(3,data);
	
	HPF(0.1,data);
	
	for(int i=0; i<num_data; i++)
	{
		cout << data[i] << "    " << LPF_data[i] << "    " << HPF_data[i] << endl;
	}
}
