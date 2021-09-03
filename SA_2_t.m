jmax=5
clc,clear
%Problem Setup%
syms x1 x2
var={x1,x2}; %variable
eqn=(4-2.1*x1^2+x1^4/3)*x1^2+x1*x2+(4*x2^2-4)*x2^2
g1=x1-3;
g2=x2-2;
g3=-x1-3;
g4=-x2-2;
g=[g1;g2;g3;g4];
%parameter setup%
r=500; % penalty parameter
K=0.3; %schedule constant
Tint=50; %intial termperature
jmax=10;
%
j=0;
while j<jmax;
x(1,1:2)=[1.5,-0.1]; %starting point
k=2; % intialize iterations
T=Tint;% initialize temperature
fx(1)=double(subs(eqn,var,x(1,:)));
L=1;
while k<100 % here set max iterations
stepsize=sqrt((norm(x(k-1,:)))/3)*(rand(1,length(var))-0.5);
xnext=x(k-1,:)+stepsize;
Penalty=r*max(double(subs(g,var,xnext)),0);
f= double(subs(eqn,var,xnext)); 
theta(k)=f+sum(Penalty);  %modified object function
if theta(k)<theta(k-1)
    x(k,:)=xnext;
    fx(k)=f;
    k=k+1;
    ite(k-1)=L;
    L=1;
else
    P = exp(-(theta(k)-theta(k-1))/(T));
    if rand<P
        x(k,:)=xnext;
        fx(k)=f;
        k=k+1;
        T=T*K;
        ite(k-1)=L;
        L=1;
    else
        L=L+1;
        if L>500
            disp('can not further improve')
            break
        end
    end
end
    if abs((theta(k-1)-theta(k-2))) < 1e-06
            disp('small dfx')
            break
    end
end
dataname=sprintf('data%i.mat',j)
save(dataname,'x','fx','ite')
plot(1:length(fx),fx)
hold on
j=j+1;
clear x fx ite theta
end
hold off



        
        
