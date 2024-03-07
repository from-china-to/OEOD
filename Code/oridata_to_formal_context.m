function F=oridata_to_formal_context(data)

C = data(:,1:end-1);
arr=[];
for j=1:size(C,2)
    temp=unique(C(:,j));
    for i=1:length(temp)
        arr=[arr, C(:,j)==temp(i)];
    end
end
F=[arr data(:,end)];