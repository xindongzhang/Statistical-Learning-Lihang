%% cost function %%
%% X = [x1;x2;x3...;xn] %%
function cost = costFun(X, L, w, b)

cost = -sum( L .* (w*X'+ b) - log( 1 + exp(w*X' + b) ) );

end