function [a_ast_ast,Weight]= compute_attribute_granules_v1(data,X)
%COMPUTE_SING_ATTRIBUTE_GRANULES 
[row,column]=size(data);
a_ast_ast=ones(column,column);
data_X=data(X,:);
ID=data_X==1;
a_ast_ast(ID,:)=repmat(data_X,sum(ID),1); 
%Compute Weight
temp=data(:,ID);
Weight=sum(min(temp,[],2))/row;
end