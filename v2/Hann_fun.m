function y = Hann_fun(n,N)
% Hann_function from class
y = (sin(pi*(n+N/2)/N).^2).*(abs(n)<=N/2);
end



