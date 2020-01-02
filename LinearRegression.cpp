#include "iot.h"

double Utils::array_sum(double arr[], int length)
{
	double s = 0;
	for(int i=0; i < length; i++)
		s+= arr[i];
	return s;
}

double *Utils::array_pow(double arr[], int length, int power)
{
	double *arr2 = new double[length];

	for(int i=0; i < length; i++)
		arr2[i] = pow(arr[i], power);
	return arr2;
}

double *Utils::array_multiplication(double arr1[], double arr2[], int len) {
    double *arr = new double[len];

    for (int i = 0; i < len; i++) {
        arr[i] = arr1[i] * arr2[i];
    }

    return arr;
}

double *Utils::array_diff(double arr1[], double arr2[], int len) {
    double *arr = new double[len];

    for (int i = 0; i < len; i++) {
        arr[i] = arr1[i] - arr2[i];
    }

    return arr;
}

LinearRegression::LinearRegression(double x[], double y[], int m) {
    this->x = x;
    this->y = y;
    this->m = m;
}

void LinearRegression::train(double alpha, int iterations) {
    double *J = new double[iterations];
    this->theta = gradient_descent(x, y, alpha, iterations, J, m);
}

double LinearRegression::predict(double x) {
    return h(x, theta);
}

double LinearRegression::compute_cost(double x[], double y[], double theta[], int m) {
    double *predictions = calculate_predictions(x, theta, m);
    double *diff = Utils::array_diff(predictions, y, m);
    double *sq_errors = Utils::array_pow(diff, m, 2);
    return (1.0 / (2 * m)) * Utils::array_sum(sq_errors, m);
}

double LinearRegression::h(double x, double theta[]) {
    return theta[0] + theta[1] * x;
}

double *LinearRegression::calculate_predictions(double x[], double theta[], int m) {
    double *predictions = new double[m];

    // calculate h for each training example
    for (int i = 0; i < m; i++) {
        predictions[i] = h(x[i], theta);
    }

    return predictions;
}

double *LinearRegression::gradient_descent(double x[], double y[], double alpha, int iters, double *J, int m) {
    double *theta = new double[2];
    theta[0] = 1;
    theta[1] = 1;

    for (int i = 0; i < iters; i++) {
        double *predictions = calculate_predictions(x, theta, m);
        double *diff = Utils::array_diff(predictions, y, m);

        double *errors_x1 = diff;
        double *errors_x2 = Utils::array_multiplication(diff, x, m);

        theta[0] = theta[0] - alpha * (1.0 / m) * Utils::array_sum(errors_x1, m);
        theta[1] = theta[1] - alpha * (1.0 / m) * Utils::array_sum(errors_x2, m);

        J[i] = compute_cost(x, y, theta, m);
    }

    return theta;
}
