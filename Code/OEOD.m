
%%Detecting Object-oriented Entropy-based Outlier Detection (OEOD) algorithm
%%Please refer to the following papers: 
%%Chang Liu, Dezhong Peng, Hongmei Chen, Zhong Yuan. 
%%Attribute granules-based object entropy for outlier detection in nominal data
%%Engineering Applications of Artificial Intelligence,2024.
%%Uploaded by Chang Liu on March 7, 2024. E-mail:liuchangai@stu.scu.edu.cn.
function OEOF=OEOD_w(data)
%%%input:
% data is data matrix without decisions, where rows for objects and columns for attributes. 
%%%output
% Ranking objects and outlier factor (OEOF).

[row,~]=size(data);

%%%%%%%%%%%%%%%%%Object-oriented Entropy-based Outlier Detection%%%%%%%%%%%
unSelect_Obj=[];
Select_Obj=[];
factor=[];
base=ones(row);

E=zeros(1,row);
Joint_E=zeros(row,row);
MI=zeros(row,row);
W=zeros(1,row);

for j=1:row
     eval(['ssr' num2str(j) '=[];']);
     [r,Wj]= compute_attribute_granules_v1(data,j);
     W(j)=sqrt(Wj);
     E(j)=entropy(r);
     eval(['ssr' num2str(j) '=r;']);
end

for i=1:row
        ri=eval(['ssr' num2str(i)]);
    for j=1:i
        rj=eval(['ssr' num2str(j)]);
        Joint_E(i,j)=entropy(min(ri,rj));
        Joint_E(j,i)=Joint_E(i,j);
        MI(i,j)=E(i)+E(j)-Joint_E(i,j);
        MI(j,i)=MI(i,j);
    end
end

Ave_MI=mean(MI,1);

[~,n1]=sort(Ave_MI,'ascend');
factor=[factor 1/(length(factor)+1)];
Select_Obj=n1(1);
unSelect_Obj=n1(2:end);

while ~isempty(unSelect_Obj)
    Aggr=[];
    for i=1:length(unSelect_Obj)
        for j=1:length(Select_Obj)
         Aggr(i,j)=Ave_MI(Select_Obj(j))-(Joint_E(Select_Obj(j),unSelect_Obj(i))...
             -E(unSelect_Obj(i)))/E(Select_Obj(j))*Ave_MI(Select_Obj(j));
        end
    end
        [~,min_tem]=min((Ave_MI(unSelect_Obj)'-mean(Aggr,2)).*W(unSelect_Obj)');
        factor=[factor 1/(length(factor)+1)];
        Select_Obj=[Select_Obj unSelect_Obj(min_tem)];
        unSelect_Obj=setdiff(unSelect_Obj,unSelect_Obj(min_tem));
end
select_object=Select_Obj;
out_factor=[select_object' factor'];
out_factor=sortrows(out_factor,1);
OEOF=out_factor(:,2);
