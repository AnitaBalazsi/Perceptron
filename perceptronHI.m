clear all;
clc;

x = [[1,1,0,1,1,1,1,1,0,1]; [1,0,1,0,0,1,0,0,1,0]]; % H, I
d = [0,1];
[N,n] = size(x);
lr = 0.01;
E = 1;

w = randn(n,1);
while E ~= 0
    E = 0;
    for i=1:N
        yi = hardlim(x(i,:)*w)
        ei = d(i) - yi;
        w = w + lr * ei * x(i,:)';
        E = E + ei^2;
    end;
    w
end;


