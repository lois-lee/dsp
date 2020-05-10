function [window] = make_window(w,f)
if w ~= 0
    if mod(w, 2) == 0  
      w = w + 1;
    end
    halfwin = 0.5 * ( 1 + cos( pi * (0:(w-1)/2)/(w-1)/2));
    window = zeros(1, f);
    index_1 = min(f/2, (w-1)/2);
    window((f/2+1):(f/2+index_1)) = halfwin(1:index_1);
    window((f/2+1):-1:(f/2-index_1+2)) = halfwin(1:index_1);
    
else
    window = ones(1,f);
end


