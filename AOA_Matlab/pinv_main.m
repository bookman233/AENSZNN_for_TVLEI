close all;
clear;
clc;
%% Inital seting 
%初始化参数设置
tf=8;%仿真总时间
tau=0.01;%采样周期
t=0:tau:tf;
% M=2;%传感器个数
M=2;%传感器个数
r=2;
%传感器位置向量
P=zeros(2,M);
P(2,:)=-7;
for m=1:M
    P(1,m)=18-12*m;
end
figure(1);
plot(P(1,:),P(2,:),'o');
hold on;
% axis equal;
% xlim([-12 12]);
% ylim([-12 12]);
% xlim([-64 64]);
% ylim([-64 64]);
xlim([-20 20]);
ylim([-20 20]);
legend('Sensor Positions')

%% 用算法进行位置的计算
for k=1:(tf/tau)
    P_T(:,:,k)=[r*(2*cos(k*tau)-cos(2*k*tau))+r;r*(2*sin(k*tau)-sin(2*k*tau) + 4)];

    delta(:,:,k)=repmat(P_T(:,:,k),1,M)-P;
    neg_tan_theta(:,:,k)=-(delta(2,:,k)./delta(1,:,k));
    MatrixA(:,:,k)=[neg_tan_theta(:,:,k); ones(1,M)]';
    MatrixB(:,:,k)=(P(2,:)+P(1,:).*neg_tan_theta(:,:,k))';
    X(:,:,k+1)=pinv(MatrixA(:,:,k))*MatrixB(:,:,k) + 5;
    M;
end

% nerr = zeros(1,tf/tau);
% for index = 1 : 1:(tf/tau)
%     nerr(index) = norm(MatrixA(:,:,index)*X(:,:,index + 1)-MatrixB(:,:,index));
% end

% nerr = zeros(1,tf/tau);
% for index = 1 : 1:(tf/tau)
%     nerr(index) = norm(MatrixA(:,:,index)*X(:,:,index + 1)-MatrixB(:,:,index));
% end

X(:,:,1)=[4;0];
% X(:,:,1)=[1;1];
X(:,:,end)=[];
t(end)=[];
% 打印目标曲线
figure(1);
plot(P_T(1,:),P_T(2,:),'k-','LineWidth',2);
hold on;
plot(X(1,:),X(2,:),'r:','LineWidth',2);
set(gca,'FontSize',14);
hold on;
legend('Sensor Positions','Target Trajectory','Solution')

figure(2)
plot(t,(X(1,:)-P_T(1,:)),'LineWidth',2);
hold on;
plot(t,(X(2,:)-P_T(2,:)),'LineWidth',2);
hold on;
set(gca,'FontSize',14);
legend('XX','YY');

figure(3);
plot(t,x_position,'LineWidth',2);
hold on;
figure(3);
plot(t,y_position,'LineWidth',2);
hold on;

nerr = zeros(1,tf/tau);
for index = 1 : 1:(tf/tau)
    tempOne = X(1,index)-P_T(1,index);
    tempTwo = X(2,index)-P_T(2,index);
    temp = [tempOne,tempTwo];
    nerr(index) = norm(temp);
end

figure(3)
nerr(1) = [];
t(1) = [];
plot(t,nerr,'LineWidth',2);
hold on;