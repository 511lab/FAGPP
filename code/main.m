clc;
clear;
% Test on COIL20 data set.
datasets_name={'COIL20'};
% Use the following script to test on all the six benchmark data sets.
% datasets_name={'COIL20','MINIST2k2k','Mnist05','PIE','UMIST','USPS'};
tools_name={'FAGPP'};
for ds=1:length(datasets_name)
    dataset=datasets_name{ds};
    file=strcat('..\dataset\',dataset,'.mat');
    load(file);
    for drt=1:length(tools_name)
        tool=tools_name{drt};
        filename=strcat('results\',dataset,"_",tool,".xlsx");
        if exist(filename,'file')
            disp("disp");
            continue;
        end
        class=length(unique(Y));
        if size(X,2)>100
            data=pca(X,100);
            [n,d]=size(data);
            strat_dim=10;
            step=10;
            end_dim=100;
        else
            data=X;
            [n,d]=size(data);
            strat_dim=1;
            step=1;
            end_dim=d;
        end
        result=[];
        for dim=strat_dim:step:end_dim
            % Sampling ratio
            sampRate=20;
            measureCount=20;
            if strcmp(tool,"FAGPP")
                iter=100;
                for k=6:1:8
                    for m=2^k-1:1:2^k-1
                        for gamma=[0.001 0.01 1 100 10000]
                            for lemma=[0.001 0.01 1 100 10000]
                                starttime=cputime;
                                [dr_data]=FAGPP(data,dim,iter,gamma,lemma,k,m);
                                runtime=cputime-starttime;
                                dr_data=real(dr_data);
                                mean_measure=measure(dr_data,Y,sampRate,measureCount)
                                result=[result;mean_measure,dim,m,k,gamma,lemma, runtime];
                            end
                        end
                     end
                 end
             end
         end
        if exist(filename,'file')
            delete(filename)
        end
        xlswrite(filename,result)
    end
end
disp("Parameters are saved...")