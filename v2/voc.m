function y = voc(x, r, scf, N, which)

if which == 1
    hop = N/4;
    X = stdft(x, N) * scf ;
    t = 0:r:(length(X)-2);
    X2 = pvsample(X, t, hop);
    y = istdft(x, X2, N)';


else 
    hop = N/4;
    X = stft(x', N, N, hop) * scf;
    t = 0:r:(length(X)-2);
    X2 = pvsample(X, t, hop);
    y = istft(X2, N, N, hop)';
end 