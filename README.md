# OEOD
Chang Liu, Dezhong Peng, Hongmei Chen, **Zhong Yuan***,  
[Attribute granules-based object entropy for outlier detection in nominal data](Paper/2024-OEOD.pdf), Engineering Applications of Artificial Intelligence, vol.  , no.  , 3 March 2024, DOI: [10.1016/j.engappai.2024.108198](https://doi.org/10.1016/j.engappai.2024.108198). (Code)


## Abstract
Concept lattice theory, which is one of the key mathematical models of granular computing, is capable of successfully dealing with uncertain information in nominal data. It has been applied to machine learning tasks such as data reduction, classification, and association rule mining. For the problem of outlier detection in nominal data, this paper presents a concept lattice theory-based approach for detecting outliers in nominal data. First, subcontexts and concept lattices based on subsets of objects are discussed. Then, information entropy is introduced into the formal context, and an object entropy based on attribute granules is proposed. Finally, a nominal data-oriented outlier detection method is explored based on the proposed object entropy. The experimental results show that the proposed detection method can effectively detect outliers in nominal data. Besides, the results of the hypothesis testing indicate that the proposed method is statistically significantly different from the other methods.
The results indicate that the proposed method is effective. The code is publicly available online at [https://github.com/from-china-to/OEOD](https://github.com/from-china-to/OEOD).

## Usage
You can run Demo_OEOD.m:
```
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


```
You can get outputs as follows:
```

out_factor =

            1
         0.25
          0.2
          0.5
      0.33333
```

## Citation
If you find OEOD useful in your research, please consider citing:
```
@article{

}
```
## Contact
If you have any question, please contact liuchangai@stu.scu.edu.cn.

