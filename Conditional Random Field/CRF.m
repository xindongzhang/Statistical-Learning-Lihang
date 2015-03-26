%% conditional random field %%
%% 
function [W, Dictionary] = CRF(TrainData, TrainLabel, Label)

if length(TrainData) ~= length(TrainLabel)
    disp(['data and label should be in the same size ']);
    return;
end

%% initialize the parameter
NoL = length(Label);
NoD = length(TrainData);

%% ------generate dictionary------ %%
NoF = 6; %% number of feature
W = zeros(1, NoF);
F = cell(1, NoF);
Dictionary = cell(1, NoF);
%% ------feature------ %%
Dictionary{1} = TrainData(TrainLabel == 'S');
F1 = zeros(1, NoD);
for i = 1:NoD
    F1(i) = sum( TrainLabel == 'S' & TrainData == TrainData(i) );
end
F{1} = F1;
%% --------------------
Dictionary{2} = TrainData(TrainLabel == 'B');
F2 = zeros(1, NoD);
for i = 1:NoD
    F2(i) = sum( TrainLabel == 'B' & TrainData == TrainData(i) );
end
F{2} = F2;
%% --------------------
Dictionary{3} = TrainData(TrainLabel == 'M');
F3 = zeros(1, NoD);
for i = 1:NoD
    F3(i) = sum( TrainLabel == 'M' & TrainData == TrainData(i) );
end
F{3} = F3;
%% -------------------
Dictionary{4} = TrainData(TrainLabel == 'E');
F4 = zeros(1, NoD);
for i = 1:NoD
    F4(i) = sum( TrainLabel == 'E' & TrainData == TrainData(i) );
end
F{4} = F4;
%% -------------------
BM = [];
ME = [];
for i = 1:NoD-1
    if TrainLabel(i) == 'B' && TrainLabel(i+1) == 'M'
        BM = [BM TrainData(i+1)];
    end
    if TrainLabel(i) == 'M' && TrainLabel(i+1) == 'E'
        ME = [ME TrainData(i+1)];
    end
end
%% ------------------
Dictionary{5} = BM;
F5 = zeros(1, NoD);
for i = 1:NoD
    F5(i) = sum( BM == TrainData(i) );
end
F{5} = F5;
%% ------------------
Dictionary{6} = ME;
F6 = zeros(1, NoD);
for i = 1:NoD
    F6(i) = sum( ME == TrainData(i) );
end
F{6} = F6;

%% ------ emprical model------ %%
PX = zeros(1, NoD);
PXY = zeros(1, NoD);
PYvX = zeros(1, NoD);

for i = 1:NoD
    PX(i) = sum( TrainData == TrainData(i) ) / NoD;
    PXY(i) = sum( TrainData == TrainData(i) & TrainLabel == TrainLabel(i) ) / NoD;
    PYvX(i) = PXY(i) / PX(i);
end

%% ------ gradient ascend ------ %%

phi = 0.5;
for i = 1:NoF
    lambda_cur = -1;
    lambda_pre = 0;
    while abs(lambda_cur - lambda_pre) > 0.1
        PYvX_M = 0;
        lambda_grad = sum( PX .* F{i}.* (PYvX - PYvX_M) );
        lambda_pre = lambda_cur;
        lambda_cur = lambda_cur + phi * lambda_grad;
    end
end

%% end of function
end