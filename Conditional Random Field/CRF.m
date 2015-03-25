%% conditional random field %%
%% 
function W = CRF(TrainData, TrainLabel, IndexFunc, Label)

if length(TrainData) ~= length(TrainLabel) || ...
   length(TrainData) ~= length(IndexFunc)  || ...
   length(IndexFunc) ~= length(TrainLabel) || ...
    disp(['data and label should be in the same size ']);
    return;
end

%% initialize the parameter
N = length(Label);
W = zeros(1, N*N);
end