function [uniqueElements, frequencies] = Freqcount(arr)
    [uniqueElements, ~, idx] = unique(arr);
    counts = accumarray(idx, 1);
    mask = counts >= 50;
    uniqueElements = uniqueElements(mask);
    frequencies = counts(mask);
end