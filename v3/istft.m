function x = istft(d, f, w, h)

col = length(d');
win = make_window(w,f);

xlen = f + (col-1)*h;
x = zeros(1,xlen);

for i = 0:h:(h*(col-1))
  ft = d(:,1+i/h)';
  ft = [ft, conj(ft(((f/2)):-1:2))];
  px = real(ifft(ft));
  x((i+1):(i+f)) = x((i+1):(i+f))+px.*win;
end