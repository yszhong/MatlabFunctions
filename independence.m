function [ref,val]=independence(M,label,alpha)
% Independence test using crosstable.
%
% [ref,val]=independence(M, label)
%
% M: n columns data, n can be 1
% label: 1 column comparison
% val: chi2 value
% ref: chi2 belief
%
% by Yunsong Zhong
% Email:15yszhong@tongji.edu.cn
if nargin<3 % undefined alpha
	alpha=0.2;
end
[~,col]=size(M);
val=zeros(1,col);
ref=zeros(1,col);
for y=1:col
    Y=M(:,y);% select column
    yu=unique(Y);
    cat=length(yu);
    xu=unique(label);
    catx=length(xu);
    u=zeros(catx+1,cat+1);%generate test matrix
    for i=1:catx
        for j=1:cat
            u(i,j)=length(find(label==xu(i) & Y==yu(j)));
        end
    end
    u(end,:)=sum(u,1);% get column sum
    u(:,end)=sum(u,2);% get row sum
    ka=0;
    for i=1:catx
        for j=1:cat
            tmp=u(end,j)*u(i,end)/u(end,end);
            tmp=(u(i,j)-tmp).^2/tmp;
            ka=ka+tmp;% compute every test number
        end
    end
    val(y)=ka;% absolute test number
    ref(y)=chi2cdf(ka,(catx-1)*(cat-1));% get chi2 belief
end
end
