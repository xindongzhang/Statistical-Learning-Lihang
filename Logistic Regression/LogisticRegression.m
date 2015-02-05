%% logistic regression %%
%% gradient descent: minimize the costFunction %%
function [w, b] = LogisticRegression(X, L, Phi, MaxIter)

[NumOfData, Len] = size(X);
w = zeros(1, Len);
b = 0;
costVal = [];

for k = 1:MaxIter
    for i = 1:NumOfData
       %% gradient descend one by one, not batch gradient %%
       %% which can better understand the algorithm       %%
        PLw = -L(i) * X(i,:) + X(i,:) * exp(w*X(i,:)' + b) ./ (1 + exp(w*X(i,:)' + b));
        PLb = -L(i) + exp(w*X(i,:)' + b) ./ (1 + exp(w*X(i,:)' + b));
        w = w - Phi * PLw;
        b = b - Phi * PLb;
        costCur = costFun(X, L, w, b);
        costVal = [costVal costCur];
    end
end
figure
plot(costVal);
title('the cost/iter')
end


