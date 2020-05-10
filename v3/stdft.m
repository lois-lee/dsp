function output = stdft(signal, N)

signal = signal(1:floor(length(signal)/N)*N);

% make Hann window
Hann = Hann_fun((0:N-1)-N/2+0.5,N)';
nvec = (0:N-1)';
m_list = 0:N/2:length(signal)-1;

% compute STDFT
output = zeros(N,length(m_list)-1);
for mm =1:length(m_list)-1
    m = m_list(mm);
    output(:,mm) = exp(-1i*2*pi/N*m*nvec).*fft(signal(1+nvec+m).*Hann)/sqrt(N);
end

end


