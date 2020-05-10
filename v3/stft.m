function D = stft(signal, f, w, h)

% expect x as a row
if size(signal,1) > 1
  signal = signal';
end

win = make_window(w,f);
len = length(signal);

counter = 1;
D = zeros((1+(f/2)),1+floor((len-f)/h));

for i = 0:h:(len-f)
  temp = win.*signal((i+1):(i+f));
  temp2 = fft(temp);
  D(:,counter) = temp2(1:(1+f/2))';
  % increment  
  counter = counter+1;
end
