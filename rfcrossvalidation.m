function [ accuracy ] = rfcrossvalidation( M, n)
% n fold cross validation of random forest
%
% [ accuracy ] = rfcrossvalidation( M, n)
%
% M: 1000*m features matrix
% n: fold times, default 10
% accuracy: accuracy of cross validation
%
% by Yunsong Zhong
% Email: 15yszhong@tongji.edu.cn
warning('off') %#ok<*WNOFF>
tempacc=zeros(n,1); %
for j=1:n
    disp(j)
    mx=(j-1)*50+1:j*50;
    my=j*50+451:j*50+500;
    tests=M([mx,my],:); % generate test data
    trains=M([setdiff(1:500,mx),setdiff(501:1000,my)],:); % generate train data
    label=[zeros(450,1);ones(450,1)]; % generate label data
    % generate random forest
    B=TreeBagger(50,trains,label,'Method','Classification','OOBVarImp','On') %#ok<*NOPRT>
    [~,score]=predict(B,tests);% test random forest
    pred=score(:,1)<score(:,2);
    accur=length(find(pred==[zeros(50,1);ones(50,1)]));
    tempacc(j)=accur/100;% compute accuracy
    clear B % clear the forest
end
accuracy=mean(tempacc);
disp(accuracy)
disp('Done')
end
