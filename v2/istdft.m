function output = istdft(x,xSTDFT, N)

x = x(1:floor(length(x)/N)*N); 

nvec = (0:N-1)';
m_list = 0:N/2:length(x)-1;

output = zeros(length(x),1);
for mm=1:length(m_list)-1
	m = m_list(mm);
    inv_fft = ifft(exp(1i*2*pi/N*m*nvec).*xSTDFT(:,mm))*sqrt(N);
	tmp = real(inv_fft);
	output(1+nvec+m) = output(1+nvec+m) + tmp;
end
end

