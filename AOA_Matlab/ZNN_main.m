% close all;
clear;
clc;

tspan = 0:0.01:8;

% 传感器数量
global Sensor_num P;
Sensor_num = 2;
% 传感器初始位置(列数要和Sensor_num保持一致)
% P = [12, 6, 0, -6;
%      -7, -7, -3, -3];
P = [12, 6;
     -7, -7];

% 初始化传感器位置
Sensor_position = zeros(2, Sensor_num);
% 初始化传感器横坐标
Sensor_position(2,:) = -7;
% 初始化传感器纵坐标
% for m = 1 : Sensor_num
%     Sensor_position(1, m) = 18 - 12 *m;
% end
for m = 1 : Sensor_num
    Sensor_position(1, m) = 18 - 12 * m;
end


figure(1);
% 传感器初始点坐标(6,-7)和(-6,-7)
plot(Sensor_position(1,:),Sensor_position(2,:),'o');
hold on;
% axis equal;
% xlim([-24 24]);
% ylim([-24 24]);
xlim([-20 20]);
ylim([-20 20]);
legend('Sensor Positions')
TM = TrajMatrix(tspan);
figure(1);
plot(TM(1,:),TM(2,:),'k-','LineWidth',2)
hold on;

% 有几个传感器就需要有几个0
% x0_inte = [4,0,0,0,0,0];
init_padding = zeros(1, Sensor_num);

init_val = [4,0];
% init_val = [-10,sqrt(100-(-10)^2)];
x0_inte = [init_val,init_padding];
% x0_inte = [4,0,0,0];
% x0_inte = [2,3,1,4,0,0,0,0];
% x0 = [2,3];
gamma = 5;
lambda = 5;
options = odeset();
% [t, x] = ode45(@RightSide_OZNN, tspan, init_val, options, gamma);
% [t, x] = ode45(@RightSide_NTZNN, tspan, x0_inte, options, gamma, lambda);
[t, x] = ode45(@RightSide_RACZNN, tspan, x0_inte, options, gamma, lambda);

x_position = zeros(length(t),1);
y_position = zeros(length(t),1);

err_x = zeros(length(t),1);
err_y = zeros(length(t),1);

for j = 1:length(t)
    T = t(j);
    A = MatrixA(T);
    b = MatrixB(T);
%     X = x(j,:);
    X = x(j,1:2);
    x_position(j) = X(1);
    y_position(j) = X(2);
    Err = A*X'-b;
    err_x(j) = Err(1);
    err_y(j) = Err(2);
    nerr(j) = norm(Err);
end

figure(1);
plot(x(:,1),x(:,2),'r:','LineWidth',2);
set(gca,'FontSize',14);
hold on;
legend('Sensor Positions','Target Trajectory','Solution')

figure(2);
set(gca,'FontSize',14)
plot(t, nerr, 'LineWidth', 2);
txt = {'||{\itE}(t)||_F'};
text(0.6,0,txt)
txt = {'{\itt} (s)'};
text(4,0.3,txt)
hold on;

figure(3);
plot(t,x_position,'LineWidth',2);
hold on;
figure(3);
plot(t,y_position,'LineWidth',2);
hold on;

figure(4)
plot(t,err_x,'LineWidth',2);
hold on;
figure(4)
plot(t,err_y,'LineWidth',2);
hold on;