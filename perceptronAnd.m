clear all;
clc;

x = [[1,0,0];[1,1,0];[1,0,1];[1,1,1]]; % bias, x1, x2
d = [0,0,0,1];
[N,n] = size(x);
lr = 0.01;
E = 1;
w = randn(n,1);

 grid on; hold on;
 axis([-1 2 -1 2]);
 for i=1:N
     if d(i) == 0
         plot(x(i,2),x(i,3),'bo');
     else 
         plot(x(i,2),x(i,3),'ro');
     end;
 end;
 
 
% w(2)*x(2) + w(3)*x(3) + w(1) = 0
p1 = -w(1)/w(3);  % w3x3 = -w1 ; w2x2 = 0
p2 = -w(1)/w(2);  % w2x2 = -w1 ; w3x3 = 0
m = p1 / (-p2);

L = linspace(-1,2);
line = plot(L,L * m + p1);

while E ~= 0
    E = 0;
    for i=1:N
        yi = hardlim(x(i,:)*w);
        ei = d(i) - yi;
        w = w + lr * ei * x(i,:)';
        E = E + ei^2;
    end;
    p1 = -w(1)/w(3);
    p2 = -w(1)/w(2);
    m = p1 / (-p2);
    
    pause(0.05)
    delete(line)
    line = plot(L,L * m + p1);
end;

