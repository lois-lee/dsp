function clip_and_write(d, sr, name_of_file)
% fixes clipping of audio
% writes into a function

d = (d/ max(abs(d)));
audiowrite(name_of_file,d, sr);

end

