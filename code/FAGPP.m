function [newX] = FAGPP(X ,dimension,iter,gamma,lemma,k,K)
    % Fast Anchor Graph Preserving Projections
    %Input: 
    % @para X denotes the input data
    % @para dimension denotes the reducted dimensionality
    % @para item represents the iteration times
    % @para gamma and lemma are two tade-off parameters
    % @para K is the number of anchors
    
    %Output: 
    % newX represents the projected data
    
    [N_row,N_column]=size(X);
    mapping.mean = mean(X, 1);
	X = bsxfun(@minus, X, mapping.mean);
	% Compute covariance matrix
    if size(X, 2) < size(X, 1)
        C = cov(X);
    else
        C = (1 / size(X, 1)) * (X * X');        
    end
    [~,locAnchor] = hKM(X',[1:N_row],k,1);
    G= ConstructA_NP(X', locAnchor,K);
    % The construction of the adjacency map is complete
    P=G;
    for i=1:iter
        centers = P'*X./(repmat(sum(P',2),1,N_column)); 
        dn=diag(sum(P,1));
        dc=diag(sum(P,2));
        M=(X'*dc*X-2*X'*P*centers+centers'*dn*centers-lemma*C);
        M=(M+M')/2;
        M(find(isnan(M)==1))=0;
        [W,B]=eig(M);
        B(isnan(B))=0;
        [B,ind]=sort(diag(B));
        W=W(:,ind(1:dimension));
        distx=L2_distance_subfun((X*W)',(centers*W)');
        P=zeros(N_row,2^k);
        for i=1:N_row
            idxa0=1:2^k;
            dxi=distx(i,idxa0);
            ad=G(i,idxa0)-gamma*(dxi)/(2);
            P(i,idxa0)=EProjSimplex_new(ad,1);
        end
         col_sum=sum(P,1);  
         P=P./repmat(col_sum,N_row,1); 
    end
    newX=X*W;
end


