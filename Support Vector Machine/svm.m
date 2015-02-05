%% solving the svm problem ---- %%
%% solcing a quadratic programming problem %%
%% L(Alpha) = 1/2 * Alpha' * [X * X' .* (L'*L)] * Alpha - sum(Alpha) %%
%% such as, sigma( Alpha[i]*L[i] ) = 0 %%
%% Alpha[i]>=0, i = 1,2,3,...,N %%

%% after solving this problem, we get Alpha, then %%
%% w* = sigma( Alpha[i]*L[i]*X[i] ) %%
%% b* = L[j] - sigma_i( Alpha[i]*L[i]* (X*X[j]') ) %%
function [w b] = svm(X, L)

[NumOfData, Len] = size(X);
H = X * X' .* (L' * L);
f = -ones(NumOfData, 1);
A = -eye(NumOfData);
b = zeros(NumOfData,1);
Aeq = L;
beq = 0;
lb = 0;
up = [];
%% solving an quadratic programming problem %%
Alpha = quadprog(H, f, A, b, Aeq, beq, lb, up);

%% calculate the w and b %%
w = sum( repmat(Alpha .* L', [1 Len]).*X, 1);
index = find(Alpha > 0, 1);
if isempty(index)
    error('the alpha is negtive');
    return;
end
b = L(index(1)) - sum(  Alpha .* L' .* (X * X(index(1),:)')  );
end