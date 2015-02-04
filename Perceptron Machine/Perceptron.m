%% Perceptron Machine %%
%% testing the alg    %%
%% f(x) = sign(w*x + b) %%
%% w is the parameter of this model, b is the bias %%
%% X = [x1;x2;x3;...;xn], b is the bias of this model %%
%% L = [l1;l2;l3;...;ln] %%
%% Phi is the learning rate %%
%% MaxIter is the Maximul Iterations %% 
function [w b] = Perceptron(X, L, Phi, MaxIter)

[NumOfData Len] = size(X);
w = zeros(1, Len);
b = 0;

for k = 1:MaxIter
    IsBreak = 1;
    for i = 1:NumOfData
        if L(i) * (w * X(i,:)' + b) <= 0
            w = w + Phi * L(i) * X(i,:);
            b = b + Phi * L(i);
            IsBreak = 0;
        end
    end
    if IsBreak
        break;
    end
end

end
