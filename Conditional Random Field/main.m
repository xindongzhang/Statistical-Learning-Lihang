%% by Xindong Zhang %%
%% ---2015-03-25----%%

close all;
clear all;
clc;


TrainData = '我爱北京天安门';
%% index function which is the beginning of a word %%
IndexFunc = [1,1,1,0,1,0,0];
TrainLabel = ['S','S','B','E','B','M','E'];

length(TrainData)

%% labels of the text labeling
label = ['B','M','E','S'];



