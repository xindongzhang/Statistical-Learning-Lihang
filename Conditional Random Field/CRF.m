%% conditional random field %%
%% 
function W = CRF(TrainData, TrainLabel)

if length(TrainData) ~= length(TrainLabel)
    disp(['data and label should be in the same size ']);
    return;
end

%% -------------- %%
Label = unique(TrainLabel);
%% initialize the parameter
NoL = length(Label);
NoD = length(TrainData);
W = zeros(1, NoL*NoL);
IndexFunc = zeros(NoL, NoD);

%% calculate the Index function
NumLabel = zeros(1, NoL);
for i = 1:NoD
    for j = 1:NoL
        if TrainLabel(i) == Label(j)
            NumLabel(i) = j;
            continue;
        end
    end
end

[rows, cols] = size(IndexFunc);
for i = 1:NoL
    for j = 1:NoL
        
    end
end

NumLabel

end