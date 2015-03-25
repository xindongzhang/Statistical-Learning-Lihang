%% by Xindong Zhang %%
%% ---2015-03-25----%%

close all;
clear all;
clc;


TrainData = '我爱北京天安门';
TrainLabel = ['S','S','B','E','B','M','E'];

W = CRF(TrainData, TrainLabel);




