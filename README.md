Photoplethysmography (PPG) data based HRV analysis algorithm
=============================================================

The purpose of this study is to investigate the feasibility of predicting a daily mental stress level from analyzing Heart Rate Variability (HRV) by using a Photoplethysmography (PPG) sensor which is integrated in the wristband-type wearable device.
 In this experiment, each participant was asked to measure their own PPG signals for 30 seconds, three times a day (at noon, 6 P.M, and 10 minutes before going to sleep) for a week. And 10 minutes before going to sleep, all participants were asked to self-evaluate their own daily mental stress level using Perceived Stress Scale (PSS). The recorded signals were transmitted and stored at each participant’s smartphone via Bluetooth Low Energy (BLE) communication by own-made mobile application.
 The preprocessing procedure was used to remove PPG signal artifacts in order to make better performance for detecting each pulse peak point at PPG signal. In this preprocessing, three- level-bandpass filtering which consisted three different pass band range bandpass filters was used.
 In this study, frequency domain HRV analysis feature that the ratio of low-frequency (0.04Hz ~ 0.15Hz) to high-frequency (0.15Hz ~ 0.4Hz) power value was used. In frequency domain analysis, autoregressive (AR) model was used, because this model has higher resolution than that of Fast Fourier Transform (FFT).
 The accuracy of this prediction was 86.35% on average of all participants. Prediction result was calculated from the leave-one-out validation.
The IoT home appliances are arranged according to the result of this prediction algorithm. This arrangement is offering optimized user’s relaxation. Also, this algorithm can help acute stress disorder patients to concentrate on getting treatment.
 
*****


1. parser.cpp

This cpp file read csv files from wearable sensor (E4, Empatica Inc. USA).
Store the recorded PPG data in memory.
Sampling rate of the wearable sensor is 64Hz. All data recorded 30 seconds.

******

2. filter.cpp

This cpp file implement FIR filter Low-pass filter and High-pass filter.
*****

3. ibi.cpp

This cpp file has find_peak function and calc_HRV function
find_peak function is window shifting scoring based peak detection (WSSPD) algorithm.
calc_HRV function calculates time domain HRV analysis.
********
4. fft.cpp

This cpp file has fast-Fourier Transform function.
*******
5. ar.cpp

This cpp file has autoregression algorithm for frequency domain HRV analysis.
*********
6. LinearRegression.cpp

This cpp file's main goal is prediction of user's stress level based on recorded Heart Rate data.
Method of prediction is linear regression.
*****
