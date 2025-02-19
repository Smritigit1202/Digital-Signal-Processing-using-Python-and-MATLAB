clear all;
clc;
n = 0:100;  % Time index
N = 1024;  % Number of FFT points
% User inputs for signal frequencies, sampling frequency, and filter specifications
f1 = input('Enter the freq of signal-1 in Hz = ');
f2 = input('Enter the freq of signal-2 in Hz = ');
fs = input('Enter the sampling freq in Hz = ');
fpass = input('Enter the pass-band freq in Hz = ');
fstop = input('Enter the stop-band freq in Hz = ');
rp = input('Enter the passband ripple in dB = ');
rs = input('Enter the stopband ripple in dB = ');
% Generate two sinusoidal signals
x1 = sin(2*pi*(f1/fs)*n);
x2 = sin(2*pi*(f2/fs)*n);
x = x1 + x2;
% Plot the input signal
subplot(2, 1, 1);
plot(n, x);
xlabel('Time index [n]');
ylabel('Amplitude');
title('Input Signal');
% FFT of the input signal
f = abs(fft(x, N));
freq = (0:N/2-1)*fs/N;
% Plot the FFT of the input signal
subplot(2, 1, 2);
plot(freq, f(1:N/2));
xlabel('Frequency in Hz');
ylabel('Magnitude');
title('FFT of Input Signal');
% Design a high-pass Chebyshev Type I filter
[n, wc] = cheb1ord((2*fpass)/fs, (2*fstop)/fs, rp, rs);
[b, a] = cheby1(n, rp, wc, 'high');
% Frequency response of the Chebyshev Type I filter
w = 0:0.001:pi;
h = freqz(b, a, w);
% Filter the signal
filtered_signal = filter(b, a, x);
freq_domain = fft(filtered_signal, N);
% New figure for filter responses
figure(2);
% Plot frequency response of the high-pass filter
subplot(2, 1, 1);
plot(w/pi*fs/2, abs(h));
xlabel('Frequency in Hz');
ylabel('Amplitude');
title('Frequency Response of HPF');
% Plot FFT of the HPF filtered signal
subplot(2, 1, 2);
plot(freq, abs(freq_domain(1:N/2)));
xlabel('Frequency in Hz');
ylabel('Magnitude');
title('FFT of HPF Filtered Signal');