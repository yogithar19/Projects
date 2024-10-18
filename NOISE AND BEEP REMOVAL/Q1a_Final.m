clc; clearvars;

fileID1 = fopen('speech_with_beeps.txt', 'r');
signal = fscanf(fileID1, '%f');
fclose(fileID1);

window_length = 160;
overlap = 80;
windows = buffer(signal, window_length, overlap, 'nodelay');

fs = 8000;
L = floor(length(signal)/(window_length/2));
beepfrequencies = [];
beepcount = [];

for i =1:L
    window = windows(:, i);
    beepfrequencies = windowfilter(window, beepfrequencies);
end

[beepfrequencies, beepcount] = Freqcount(beepfrequencies);

Q = 10;

filtered_signal = signal;
beepfrequencies = beepfrequencies(1:length(beepfrequencies)/2);
beepcount = beepcount(2:length(beepcount)/2);
for i = 1:length(beepfrequencies)
    bw = (beepfrequencies(i)/(fs/2))/Q;
    [b, a] = iirnotch(beepfrequencies(i)/(fs/2),bw,7);
    filtered_signal = filter(b,a,filtered_signal);
    filtered_signal = filter(b,a,filtered_signal);
    filtered_signal = filter(b,a,filtered_signal);
    filtered_signal = filter(b,a,filtered_signal);
end
filtered_signal = 1.5*filtered_signal;
sound(signal,fs);
pause(60);
sound(filtered_signal,fs);