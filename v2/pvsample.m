function output = pvsample(stftArray, timeSamples, hop)
[rows,~] = size(stftArray);
% disp(rows);
% disp(cols);
N = 2*(rows-1);
%initialize values
output = zeros(rows, length(timeSamples));
ind = 1;
prevPhase = 0;
cumulativePhase = 0;
deltaPhase = zeros(1,N/2+1);
deltaPhase(2:(1 + N/2)) = (2*pi*hop)./(N./(1:(N/2)));
for t=timeSamples
    %disp(i);
    currentFrame = stftArray(:,floor(t)+[1]);
    frameMag = abs(currentFrame);
    framePhase = angle(currentFrame);
    %get phase difference between the current frame and prev
    phaseDiff = framePhase - prevPhase - deltaPhase';
    prevPhase = framePhase;
    %fit within 2pi period from -pi:pi
    phaseDiff = phaseDiff - 2 * pi * round(phaseDiff/(2*pi));
    %store shifted frame to use for istft later
    output(:,ind) = frameMag .* exp(1j*cumulativePhase);
    %accumulate phase to use fo rnext fram
    cumulativePhase = cumulativePhase + phaseDiff + deltaPhase';
    ind = ind+1;
end