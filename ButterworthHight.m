close all;
n = 0:100;
N = 1024;
% Input frequencies
f1 = input('Enter the frequency of signal-1 in Hz: ');
f2 = input('Enter the frequency of signal-2 in Hz: ');
fs = input('Enter the sampling frequency in Hz: ');
% Filter specifications
fpass = input('Enter the pass-band frequency: ');
fstop = input('Enter the stop-band frequency: ');
rp = input('Enter the passband ripple: ');
rs = input('Enter the stopband ripple: ');
% Signal generation
x1 = sin(2*pi*(f1/fs)*n);
x2 = sin(2*pi*(f2/fs)*n);
x = x1 + x2;
% Plot input signal
subplot(2, 1, 1);
plot(n, x);
xlabel('Time index [n]');
ylabel('Amplitude');
title('Input Signal');
% FFT of input signal
f = abs(fft(x, N));
freq = (0:N-1)*(fs/N);
% Plot FFT of input signal
subplot(2, 1, 2);
plot(freq(1:N/2), f(1:N/2));
xlabel('Frequency in Hz');
ylabel('Magnitude');
title('FFT of Input Signal');
% Filter design using Butterworth filter
[n, wc] = buttord((2*fpass)/fs, (2*fstop)/fs, rp, rs);
[b, a] = butter(n, wc, 'high');
h = freqz(b, a, linspace(0, pi, 1024));
% Filter the signal
filtered_signal = filter(b, a, x);
freq_domain = fft(filtered_signal, N);
% Plot frequency response of the filter
figure(2);
subplot(2, 1, 1);
plot(linspace(0, fs/2, 1024), abs(h));
xlabel('Frequency in Hz');
ylabel('Amplitude');
title('Frequency Response');
% Plot FFT of the filtered signal
subplot(2, 1, 2);
plot(freq(1:N/2), abs(freq_domain(1:N/2)));
xlabel('Frequency in Hz');
ylabel('Magnitude');
title('FFT of HPF Filtered Signal');
