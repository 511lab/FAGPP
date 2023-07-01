function [full_label,sample_lbl,sample_lbl_index]=Random_sampling(label,percent,method)
    [n,m]=size(label);
    sample_lbl=[];
    full_label=zeros(n,m)-1;
    switch method
        case 'class'
            [sorted_label,idx_label]=sort(label);
            c=unique(sorted_label)';
            count=0;
            index=[];
            for i=c
                lbl=sorted_label(sorted_label(:,1)==i);
                len=length(lbl);
                num=min(ceil(len*percent/100),len);
                idx=randperm(len,num);
                idx=sort(idx)+count;
                index=[index;idx'];
                count=count+len;
            end
            sample_lbl_index=idx_label(index);
        case 'all'
            num=min(ceil(n*percent/100),n);
            sample_lbl_index=sort(randperm(n,num));
    end   
    for i=sample_lbl_index'
        sample_lbl=[sample_lbl;label(i,:)];
        full_label(i,:)=label(i,:);
    end
    
end