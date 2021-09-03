clc,clear
j=0
figure
[x1,x2] = meshgrid(-1:.005:1,-1:.005:1);
Z=0.2+x1.^2+x2.^2-0.1*cos(6*pi*x1)-0.1*cos(6*pi*x2);
contour(x1,x2,Z)
hold on
while j<10
id=sprintf('data%i.mat',j)
load(id)
plot(x(:,1),x(:,2),'k')
plot(x(1,1),x(1,2),'b*') %starting point
plot(x(length(x),1),x(length(x),2),'r*') %end point
axis([-1.5,1.5,-1,1])
j=j+1
end
hold off
%%
figure
hold on
j=0
while j<10
id=sprintf('data%i.mat',j)
load(id)
plot(1:length(x),ite)
j=j+1;
end
hold off
%%
figure
hold on
j=0
while j<10
id=sprintf('data%i.mat',j)
load(id)
plot(1:length(x),fx)
j=j+1;
end
hold off