
wave_file = 'the_box.wav';

% wave file
[audioIn,fs]=audioread(wave_file);     % read the wav file in   
% [audioIn,fs] = audioread('Counting-16-44p1-mono-15secs.wav');
[f0,idx] = pitch(audioIn,fs);