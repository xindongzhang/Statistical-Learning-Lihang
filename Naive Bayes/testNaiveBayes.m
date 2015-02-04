close all;
clear all;
clc;

%% S = 1, M = 2, L = 3 %%
X = [1 1 1 1 1 2 2 2 2 2 3 3 3 3 3; ...
     1 2 2 1 1 1 2 2 3 3 3 2 2 3 3];
L = [-1 -1 1 1 -1 -1 -1 1 1 1 1 1 1 1 -1];
x = [2;1];
l = NaiveBayesF(X, L, x);
disp(['the label of x is: ' num2str(l)])

