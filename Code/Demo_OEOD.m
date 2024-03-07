clc;
clear all;
format shortG

data_nameori='Example';
data_name='Example';

eval(['load ' data_nameori ';']);

Dataori=Example;

trandata=Dataori;
trandata=oridata_to_formal_context(trandata);

out_factor=OEOD(trandata(:,1:end-1))
