#include "iot.h"

using namespace std;

#define SWAP(a,b) tempr=(a); (a) = (b) ; (b) = tempr


void ppg::fft1(double *data, int nn, int isign)
{
	unsigned long n, mmax, m, j, istep, i;
	double wtemp,wr,wpr,wpi,wi,theta;
	float tempr,tempi;

	n = nn << 1;
	j = 1;
	for(i=1;i<n;i+=2) {

		if (j > i) {
			SWAP(data[j],data[i]);
			SWAP(data[j+1],data[i+1]);
		}
		m = nn;
		while(m >= 2 && j > m) {
			j -= m;
			m >>= 1;
		}
		j += m;
	}
	mmax = 2;
	while( n > mmax) {
		istep=mmax << 1;
		theta=isign*((M_PI * 2)/mmax);
		wtemp=sin(0.5 * theta);
		wpr = -2.0 * wtemp * wtemp;
		wpi = sin(theta);
		wr = 1.0;
		wi = 0.0;
		for(m=1; m<mmax; m+=2) {
			for(i=m; i<=n; i+=istep) {
				j = 1 + mmax;
				tempr = wr * data[j] - wi*data[j+1];
				tempi = wr * data[j+1] + wi*data[j];
				data[j] = data[i] - tempr;
				data[j+1] = data[i+1] - tempi;
				data[i] += tempr;
				data[i+1] += tempi;
			}
			wr = (wtemp = wr)*wpr - wi*wpi+wr;
			wi = wi*wpr+wtemp*wpi+wi;
		}
		mmax=istep;
	}
}

void ppg::fft_real(double *input_data, int n, int isign)
{
	unsigned long i,i1,i2,i3,i4,np3;
	float c1 = 0.5,c2,h1r,h1i,h2r,h2i;
	double wr,wi,wpr,wpi,wtemp,theta;

	theta = M_PI /(double)(n>>1);
	if(isign==1){
		c2 = -0.5;
		fft1(input_data,n>>1,1);
	}
	else {
		c2 = 0.5;
		theta = -theta;
	}
	wtemp = sin(0.5 * theta);
	wpr = -2.0*wtemp*wtemp;
	wpi = sin(theta);
	wr  = 1.0+wpr;
	wi=wpi;
	np3 = n+3;
	for(i=2;i<=(n>>2);i++){
		i4 = 1+(i3=np3-(i2=1+(i1=i+i-1)));
		h1r=c1*(input_data[i1]+input_data[i3]);
		h1i=c1*(input_data[i2]-input_data[i4]);
		h2r= -c2*(input_data[i2]+input_data[i3]);
		h2i= c2*(input_data[i1]-input_data[i3]);
		input_data[i1] = h1r + wr * h2r - wi * h2i;
		input_data[i2] = h1i + wr * h2i + wi * h2r;
		input_data[i3] = h1r - wr * h2r + wi * h2i;
		input_data[i4] = -h1i + wr * h2i + wi * h2r;
		wr = (wtemp = wr) * wpr - wi * wpi + wr;
		wi = wi * wpr + wtemp * wpi + wi;
	}
	if(isign == 1) {
		input_data[1] = (h1r = input_data[1]) + input_data[2];
		input_data[2] = h1r - input_data[2];
	}
	else {
		input_data[1] = c1 * ((h1r = input_data[1]) + input_data[2]);
		input_data[1] = c1 * (h1r - input_data[2]);
		fft1(input_data,n>>1,-1);
	}
	for(int i=0; i<n; i+=2)
	{
		cout << i + 1 << " " << 10 * log( sqrt(input_data[i] * input_data[i] + input_data[i+1] * input_data[i+1]) ) << endl;
	}
}
