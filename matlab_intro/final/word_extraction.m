% Load a sound file
[sound_data, fs] = audioread('test.wav'); % Replace with your audio file
sound_data = sound_data(:, 1); % Use only the first channel if stereo

% Play the original sound
sound(sound_data, fs);
##pause(length(sound_data)/fs + 1); % Wait for the sound to finish

% Display original sound waveform
figure;
subplot(2, 1, 1);
plot(sound_data);
title('Original Sound Waveform');
xlabel('Samples');
ylabel('Amplitude');

% Create a simple reverb effect
delay_samples = round(0.1 * fs); % 100ms delay
reverb_gain = 0.5; % Gain for the delayed sound

% Create a new array for the output
sound_with_reverb = zeros(size(sound_data));
for n = 1:length(sound_data)
    sound_with_reverb(n) = sound_data(n);
    if n > delay_samples
        sound_with_reverb(n) = sound_with_reverb(n) + reverb_gain * sound_data(n - delay_samples);
    end
end

% Play the sound with reverb
sound(sound_with_reverb, fs);
##pause(length(sound_with_reverb)/fs + 1); % Wait for the sound to finish

% Display sound with reverb waveform
subplot(2, 1, 2);
plot(sound_with_reverb);
title('Sound Waveform with Reverb Effect');
xlabel('Samples');
ylabel('Amplitude');

% Split the audio into segments (e.g., words)
% Assume we have a predefined threshold to detect silence for word segmentation
 % Amplitude threshold

windowSize = 100; % Define the size of the moving window

% Calculate the moving RMS
rmsMovingWindow = zeros(1, length(sound_data) - windowSize + 1); % Preallocate array

for i = 1:length(rmsMovingWindow)
    % Extract the current window
    currentWindow = sound_data(i:i + windowSize - 1);

    % Compute RMS for the current window
    rmsMovingWindow(i) = sqrt(mean(currentWindow.^2));
end
figure
plot(rmsMovingWindow)
threshold = 0.025;
is_silence = abs(rmsMovingWindow) < threshold;

% Find indices where sound is present
word_indices = find(~is_silence);
start_indices = [1; find(diff(word_indices) > 1)' + 1];
end_indices = [find(diff(word_indices) > 1)'; length(word_indices)];

% Display the segments
figure;
for i = 1:length(start_indices)
    segment = sound_data(word_indices(start_indices(i)):word_indices(end_indices(i)));
    subplot(length(start_indices), 1, i);
    plot(segment);
    title(['Segment ' num2str(i)]);
    xlabel('Samples');
    ylabel('Amplitude');
end

% Optionally save segments to files
for i = 1:length(start_indices)
    segment = sound_data(word_indices(start_indices(i)):word_indices(end_indices(i)));
    sound(segment, fs);
    pause(length(segment)/fs + 1);

end

