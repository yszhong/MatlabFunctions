function shape=nonempty(A,block)
% find non empty blocks.
% created by Yunsong Zhong
if nargin<2
    block=32;
end
A=sparse(A);
[m,n]=size(A);
shape=zeros(ceil(max(m,n)/block));
[i,j]=find(A);
len=length(max(i,j));
for k=1:len
    i(k)=ceil(i(k)/block);
    j(k)=ceil(j(k)/block);
    shape(i(k),j(k))=1;
end
spy(shape);
end
