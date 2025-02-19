close all; 
clear all; 
clc;
% Define parameters
n = 0:100;    % Time samples
N = 1024;     % Number of FFT points
% User inputs for signal frequencies and filter parameters
f1 = input('Enter the frequency of signal-1 in Hz: ');
f2 = input('Enter the frequency of signal-2 in Hz: ');
fs = input('Enter the sampling frequency in Hz: ');
fpass = input('Enter the pass-band frequency: ');
fstop = input('Enter the stop-band frequency: ');
rp = input('Enter the passband ripple: ');
rs = input('Enter the stopband ripple: ');
% Generate signals
x1 = sin(2*pi*(f1/fs)*n);
x2 = sin(2*pi*(f2/fs)*n);
x = x1 + x2;
% Plot input signal
subplot(2, 1, 1);
plot(n, x);
xlabel('Time index [n]');
ylabel('Amplitude');
title('Input Signal');
% Compute FFT of input signal
f = abs(fft(x, N));
freq = (0:N-1)*(fs/N);
% Plot FFT of input signal
subplot(2, 1, 2);
plot(freq(1:N/2), f(1:N/2));
xlabel('Frequency in Hz');
ylabel('Magnitude');
title('FFT of Input Signal');
% Design Chebyshev Type II filter
[n, wc] = cheb2ord((2*fpass)/fs, (2*fstop)/fs, rp, rs);
[b, a] = cheby2(n, rs, wc);
% Frequency response of the filter
w = linspace(0, pi, 1024);
h = freqz(b, a, w);
% Filter the signal
filtered_signal = filter(b, a, x);
freq_domain = fft(filtered_signal, N);
% Plot FFT of the filtered signal
figure(2);
subplot(2, 1, 2);
plot(freq(1:N/2), abs(freq_domain(1:N/2)));
xlabel('Frequency in Hz');
ylabel('Magnitude');
title('FFT of LPF Filtered Signal');
% Plot frequency response of the filter
subplot(2, 1, 1);
plot((w/pi)*(fs/2), abs(h)); % Convert frequency axis to Hz
xlabel('Frequency in Hz');
ylabel('Amplitude');
title('Frequency Response of LPF');