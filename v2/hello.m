% get freqs from audio toolbox
clear all;
num = 2;                         
den = 3;
scf = 2^(1/12);
n = 256*2;

[x, fs] = audioread('cmajor.wav');
% [f0,idx] = pitch(x,fs);
% subplot(2,1,1)
% plot(x)
% ylabel('Amplitude')
% 
% subplot(2,1,2)
% plot(idx,f0)
% ylabel('Pitch (Hz)')
% xlabel('Sample Number')

ranges = [];
freqs = load('freqs.mat');
freqs = freqs.f0;
freqs = if_stereo(freqs); 
pitches = [220, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00];
% change it to closest note
for i = 1:length(freqs)
    [~,~,idx]=unique((abs(pitches-freqs(i))));
    minVal=pitches(idx==1);
    freqs(i) = minVal;
end
% disp(freqs)

% find ranges
last_note = 0;
for i = 1:length(freqs)
    
    if last_note ~= freqs(i)
        ranges = [ranges, i];
        last_note = freqs(i);
    end 
end
% disp(ranges)

temp = [];
for i  = 2:length(ranges)
    if (ranges(i-1) ~= ranges(i)-1)
        temp = [temp, ranges(i-1)];
    end
end
temp = [temp, ranges(length(ranges))];
temp = [temp, length(freqs)];
% disp(temp)

scaling = length(x)/length(freqs);

for i = 1:length(temp)
    temp(i) = round((temp(i)-1)*scaling+1);
end
disp(temp)

% apply to ranges

output = [];
for i = 2:length(temp)
    disp(freqs(round(temp(i-1)/444+10)))
    if freqs(round(temp(i-1)/444+10)) == 220 || freqs(round(temp(i-1)/444+10)) == 329.63
        signal = [x(temp(i-1):temp(i)),x(temp(i-1):temp(i))]; 
        vocoded = voc(signal, num/den, scf, n, 0);
        output = [output, vocoded(1:length(vocoded)/2)'];
    else
        output = [output, x(temp(i-1):temp(i))];
    end
end



% original
x = resample(x, num, den); 
clip_and_write(x, fs, 'original.wav');

% adjusted
f = resample(output, num, den); 
clip_and_write(f, fs, 'hiya.wav');

    
