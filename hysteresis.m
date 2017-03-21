function [ output ] = hysteresis( series, amplitude, threshold )
% Give a hysteresis funtion on a time series. 
%
% output = hysteresis(series, amplitude, threshold)
% series: L*n matrix with L timestamps and n different time series
% amplitude: positive integer of output amplitude
% threshold: positive integer of changing threshold
% output: L*n series
%
% by Yunsong Zhong
[L, n]=size(series);
output=zeros(L, n);
for j=1:n
    for i=1:L
        if series(i, j) > threshold
            output(i, j)=amplitude;
        elseif series(i, j) < -threshold
            output(i, j)=-amplitude;
        else
            output(i, j)=output(i-1, j);
        end
    end
end
end

