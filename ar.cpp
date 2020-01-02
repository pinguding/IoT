#include "iot.h"

using namespace std;

void ppg::memcof(double *data, int n, int m, double &xms, double *d)
{
	int k,j,i;
	double p=0.0,*wk1,*wk2,*wkm;
	wk1 = new double[n]; 
	for(int idx=0; idx < n; idx++) wk1[idx] = 0;
	wk2 = new double[n];
	for(int idx=0; idx < n; idx++) wk2[idx] = 0;
	wkm = new double[m];
	for(int idx=0; idx < m; idx++) wkm[idx] = 0;
	
	for(j=0; j<n; j++)
		p += (data[j] * data[j]);
	xms = p/n;
	wk1[0] = data[0];
	wk2[n-2] = data[n-1];
	for(j=1;j<n-1;j++)
	{
		wk1[j] = data[j];
		wk2[j-1] = data[j];
	}
	for(k=0; k<m; k++)
	{
		double num=0.0, denom=0.0;
		for(j=0;j<(n-k-1);j++)
		{
			num += (wk1[j]*wk2[j]);
			denom += (wk1[j] * wk1[j]) + (wk2[j] * wk2[j]);
		}
		d[k] = 2.0 * num/denom;
		xms *= (1.0 - (d[k] * d[k]));
		for(i=0; i<k; i++)
			d[i] = wkm[i] - d[k] * wkm[k-1-i];
		if(k == m-1)
		{
			delete wk1, wk2, wkm;
			return;
		}
		for(i=0;i<=k;i++) wkm[i] = d[i];
		for(j=0;j<(n-k-2); j++) 
		{
			wk1[j] -= (wkm[k] * wk2[j]);
			wk2[j] = wk2[j+1] - wkm[j] * wk1[j+1];
		}
	}
	throw("never get here in memcof");
}

double ppg::evlmem(const double fdt, double *d, int m, const double xms)
{
	int i;
	double sumr = 1.0, sumi=0.0, wr = 1.0, wi = 0.0, wpr , wpi, wtemp, theta;

	theta = 2 * 3.141592 * fdt;
	wpr = cos(theta);
	wpi = sin(theta);
	for(i=0; i<m; i++) {
		wr = (wtemp=wr) * wpr - wi * wpi;
		wi = wi * wpr + wtemp * wpi;
		sumr -= d[i] * wr;
		sumi -= d[i] * wi;
	}
	return xms/(sumr*sumr + sumi*sumi);
}

double ppg::calc_ibi_sampling_interval()
{
	double ibiSample;
	ibiSample = HRV_size / 30.00;
	return 1/ibiSample;
}
