function [beepfrequencies2] = windowfilter(windowin,beepfrequencies)
    fs = 8000;
    fft_window = fft(windowin);
    mag_spec = abs(fft_window);
    average = mean(mag_spec);
    standard_deviation = std(mag_spec);
    threshold = average + 7*standard_deviation;
    exceeding_indices = find(mag_spec> threshold);
    N = length(mag_spec);
    frequencies = (0:N-1) * fs / N;
    exceeding_frequencies = frequencies(exceeding_indices);
    beepfrequencies2 = [beepfrequencies, exceeding_frequencies];
end

