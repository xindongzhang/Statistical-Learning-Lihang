%% by Xindong Zhang %%
%% ---2015-03-25----%%

close all;
clear all;
clc;


TrainData = '�Ұ������찲��';
TrainLabel = ['S','S','B','E','B','M','E'];

W = CRF(TrainData, TrainLabel);




