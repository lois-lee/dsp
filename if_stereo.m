function [x] = if_stereo(x)
% checks if the audio has left, right, if it doesn't return the signal but
% if it does, average the two sides.
    [~, columns] = size(x);
    
    if (columns == 2)
        l = x(:,1);
        r = x(:,2);
        x = (l + r) / 2;
    end 
end

