function [ corr ] = cramersv( matrix )
% Compute Cramer's V dependency.
%
% corr = cramersv(matrix)
% matrix: count of each category. 
% corr: computed dependency, in range of [0, 1]. 
% The more corr, the more dependency. 
%
% by Yunsong Zhong
% December 6, 2016.
%Email: 15yszhong@tongji.edu.cn

[m, n] = size(matrix);
chi2 = 0;
for i = 1:m
    for j = 1:n
        expect=sum(matrix(:,n))*sum(matrix(m,:))/sum(sum(matrix));
        chi2=chi2+power(matrix(m,n)-expect,2)/expect;
    end
end
corr=power(chi2/(sum(sum(matrix))*(min(m,n)-1)),0.5);

end

