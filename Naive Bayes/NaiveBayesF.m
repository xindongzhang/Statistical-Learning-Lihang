%% naive bayes algorithm %%
%% book: page50          %%
function l = NaiveBayesF(X, L, x)
%% NumOfFeaData: is the number of features on each data %%
%% Len: the length of each features                     %%
[NumOfData Len] = size(X);
%% UL:the unique value of labels %%
%% N: the kinds of labels        %%
UL = unique(L);
N = length(UL);
%% PL : P(L = li) %%
%% PXL : P(X = Xij, L = lk) %%
%% PXcL: : P(X = Xij | L = lk) %%
%% result: PL * TT (PXcL) %%
PL = zeros(1,N);
result = zeros(1,N);
for i = 1:N
    PL(i) = sum( L == UL(i)) / Len;
    result(i) = PL(i);
    for k = 1:NumOfData
        PXL = sum(L == UL(i) & X(k,:) == x(k)) / Len;
        PXcL = PXL / PL(i); 
        result(i) = result(i) * PXcL;
    end 
end
%% l: is the final label of x %%
l = UL(find(result == max(result)));
end