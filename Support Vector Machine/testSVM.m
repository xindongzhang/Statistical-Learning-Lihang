close all;
clear all;
clc;

X = [3 3;4 3;1 1];
L = [1 1 -1];
Phi = 1;
MaxIter = 50;


[w, b] = svm(X, L);


Neg_X = X(find(L == -1), :);
Neg_L = L(find(L == -1));

Pos_X = X(find(L == 1), :);
Pos_L = L(find(L == 1));

figure
plot(Neg_X(:,1), Neg_X(:,2), '*');
hold on
plot(Pos_X(:,1), Pos_X(:,2), 'ro');
hold on
axis([0 5 0 4])

%% plot the separated-margin %% 
x = 0:0.01:5;
y = -(w(1) .* x + b) ./ w(2);
plot(x,y)

title('Perceptron Machine');