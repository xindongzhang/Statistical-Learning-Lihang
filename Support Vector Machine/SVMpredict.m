%% supporse that the input x is collumn vector %%
%% f(x) = sign(w*x + b) is the classification margin %%
function l = SVMpredict(w, b, x)

l = sign(w*x+b);

end