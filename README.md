Photoplethysmography (PPG) data based HRV analysis algorithm
=============================================================

1. parser.cpp

This cpp file read csv files from wearable sensor (E4, Empatica Inc. USA).
Store the recorded PPG data in memory.
Sampling rate of the wearable sensor is 64Hz. All data recorded 30 seconds.

2. filter.cpp

This cpp file implement FIR filter Low-pass filter and High-pass filter.

3. ibi.cpp

This cpp file has find_peak function and calc_HRV function
find_peak function is window shifting scoring based peak detection (WSSPD) algorithm.
calc_HRV function calculates time domain HRV analysis.

4. fft.cpp

This cpp file has fast-Fourier Transform function.

5. ar.cpp

This cpp file has autoregression algorithm for frequency domain HRV analysis.

6. LinearRegression.cpp

This cpp file's main goal is prediction of user's stress level based on recorded Heart Rate data.
Method of prediction is linear regression.
