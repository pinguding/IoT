#include <iostream>
#include <string>
#include <cstring>
#include <fstream>
#include <algorithm>
#include <cstdlib>
#include <vector>
#include <cmath>
#include <complex>
#include <valarray>
#include <map>

using namespace std;

typedef complex<double> Complex;
typedef valarray<Complex> CArray;

const int ppg_sampling_rate = 64;
const int acc_sampling_rate = 32;
const int gsr_sampling_rate = 4;

class ppg
{
	private:
		int num_data;
		double *data;
		double *HRV;
		int HRV_size;
		double mean_HR;
		double SDNN;
		double RMSSD;
		double *LPF_data;
		double *HPF_data;
		double *BPF_data;
		double ULF_power;
		double LF_power;
		double HF_power;
		
		int arOrder;
		double *d;
		double XMS;	
	public:
		void get_ppg_data(vector<double> ppg_data_sets); //Implemented in parser.cpp
		void LPF(double cut_off_freq,double *input_data);	//Implemented in filter.cpp
		void BPF(double Lcut_off_freq, double Hcut_off_freq, double *input_data); //Implemented in filter.cpp
		void HPF(double cut_off_freq, double *input_data); //Implemented in filter.cpp
		void calc_HRV(vector< pair<int,int> > IBI);	   // Implemented in ibi.cpp
		void testing();        // Implemented in filter.cpp
		double *data_return(string type); // Implemented in makeplot.cpp
		int size_return();     // Implemented in makeplot.cpp
		void run();			   // Implemented in run.cpp
		void find_peak(double *input_data, int data_size); // Implemented in ibi.cpp
		void fft1(double *input_data, int data_half_size, int isign);
		void fft_real(double *input_data, int data_half_size, int isign); 
		void memcof(double *data, int n, int m, double &xms, double *d);
		double evlmem(const double fdt, double *d, int m, const double xms);
		double calc_ibi_sampling_interval();
		double report_result();
};
class gsr
{
	private:
		int num_data;
		double *data;

	public:
		void get_gsr_data(vector<double> grs_data_sets);
        void run();
};

class acc
{
	private:
		int num_data;
		double *x_data;
		double *y_data;
		double *z_data;
	public:
		void get_acc_data(vector<double> X_acc, vector<double> Y_acc, vector<double> Z_acc);
        void run();
};

class Utils {
	public:
		static double array_sum(double arr[], int length);
		static double *array_pow(double arr[], int length, int power);
		static double *array_multiplication(double arr1[], double arr2[], int length);
		static double *array_diff(double arr1[], double arr2[], int length);

};

class LinearRegression {

public:

    // First feature
    double *x;

    // Target feature
    double *y;

    // Number of training examples
    int m;

    // The theta coefficients
    double *theta;

    /**
     * Create a new instance from the given data set.
     */
    LinearRegression(double x[], double y[], int m);

    /**
     * Train the model with the supplied parameters.
     *
     * @param alpha         The learning rate, e.g. 0.01.
     * @param iterations    The number of gradient descent steps to do.
     */
    void train(double alpha, int iterations);

    /**
     * Try to predict y, given an x.
     */
    double predict(double x);

private:

    /**
     * Compute the cost J.
     */
    static double compute_cost(double x[], double y[], double theta[], int m);

    /**
     * Compute the hypothesis.
     */
    static double h(double x, double theta[]);

    /**
     * Calculate the target feature from the other ones.
     */
    static double *calculate_predictions(double x[], double theta[], int m);

    /**
     * Performs gradient descent to learn theta by taking num_items gradient steps with learning rate alpha.
     */
    static double *gradient_descent(double x[], double y[], double alpha, int iters, double *J, int m);

};

struct subject
{
	string std_id;
	string device_id;
	int time_section; //if 0 == noon, 1 == 6pm, 2 == right before the sleep//
	ppg ppg_data;
	gsr gsr_data;
	acc acc_data;
};

void parsing(subject &SUB, string argv);
void ppgplot(subject &SUB, char *argv);
void accplot(subject &SUB, char *argv);
void gsrplot(subject &SUB, char *argv);
void run(subject &SUB, string datatype);

