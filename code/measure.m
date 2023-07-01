function [mean_measure,std_measure]=measure(data,target,num_samp,iters)
measure=[];
for count=1:iters
    [~,~,idx_train]=Random_sampling(target,num_samp,'class');
    idx_test=setdiff(1:length(target),idx_train);
    mdl=fitcknn(data(idx_train,:),target(idx_train),'NumNeighbors',1,'Distance','euclidean');
    pred_label=predict(mdl,data(idx_test,:));
    [out] = classification_evaluation(target(idx_test)',pred_label');
    measure=[measure;out.avgAccuracy,out.fscoreMacro,out.fscoreMicro];
end
mean_measure=mean(measure,1);
std_measure=std(measure,1);
end

