% Load a sound file
[sound_data, fs] = audioread('test.wav'); % Replace with your audio file
sound_data = sound_data(:, 1); % Use only the first channel if stereo

% Play the original sound
sound(sound_data, fs);
pause(length(sound_data)/fs + 1); % Wait for the sound to finish

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

##TODO add reverb effect and play the sound



% Split the audio into segments (e.g., words)
% Assume we have a predefined threshold to detect silence for word segmentation
##TODO 1. calculate RMS in moving window (N=100)
##2. Plot the rectified signal and calculate the threshold
##3. apply threshold and find intervals (look at find intervals function
##4. show on the display splitted word
##5. play splitted words

