% SCRIPT TO RUN
clear all;
% instructions:
% change the below parameters and wave file and run this script to hear a
% shifted and changed sample rate.

% parameters
num = 2;                         
den = 3;
scf = 1;
n = 1024;
wave_file = 'the_box.wav';

% wave file
[a,sr]=audioread(wave_file);            % read the wav file in       
a = if_stereo(a);                       % average lft and right channels    
vocoded = voc(a, num/den, scf, n, 1);     % apply the vocoder

% original
clip_and_write(a, sr, 'original_box.wav');

% adjusted
f = resample(vocoded, num, den); 
clip_and_write(f, sr, 'shifted_box.wav');


% https://www.mathworks.com/help/signal/ref/resample.html
% https://www.mathworks.com/help/matlab/ref/soundsc.html

