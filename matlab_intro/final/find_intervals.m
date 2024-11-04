function start_indices, end_indices = find_intervals(signal, threshold)
    % Find start and end indices of below-threshold segments
    is_silence = abs(rmsMovingWindow) < threshold
    word_indices = find(~is_silence);
    start_indices = [1; find(diff(word_indices) > 1)' + 1];
    end_indices = [find(diff(word_indices) > 1)'; length(word_indices)];
end
