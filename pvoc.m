function y = pvoc(x, r, scf, N)

hop = N/4;
X = stdft(x, N) * scf ;
t = 0:r:(length(X)-2);
X2 = pvsample(X, t, hop);
y = istdft(x, X2, N)';