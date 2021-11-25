tspan = [0 20];
options = odeset();
u0 = 2 * (rand(5,1) - 0.5 * ones(5,1));
[t, u] = ode45(@ZnnRight, tspan, u0, options);
    
subplot(3,2,1);
plot(t, u(:,1), 'LineWidth', 1);
hold on;

subplot(3,2,2);
plot(t, u(:,2), 'LineWidth', 1);
hold on;

subplot(3,2,3);
plot(t, u(:,3), 'LineWidth', 1);
hold on;

subplot(3,2,4);
plot(t, u(:,4), 'LineWidth', 1);
hold on;

subplot(3,2,5);
plot(t, u(:,5), 'LineWidth', 1);
hold on;

subplot(3,2,6);
plot(t, u(:,5), 'LineWidth', 1);
hold on;

% for j = 1:length(t)
%     T = t(j);
%     A = MatrixA(T);
%     C = MatrixC(T);
%     [m_A,n_A] = size(A); 
%     [m_C,n_C] = size(C);
%     D = zeros(m_C);
%     W = [A,zeros(m_A,m_C);C,D];
%     b = Matrixb(T);
%     d = Matrixd(T);
%     q = [b;d]; 
%     
%     err(:,j) = W * u(j,:) - q;
%     nerr(j) = norm(err(:,j));
% end