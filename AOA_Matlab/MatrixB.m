function output = MatrixB(t)
%     A = [2*(2*cos(t)-cos(2*t))+2 - (6), 2*(2*cos(t)-cos(2*t))+2 - (-6);
%          2*(2*sin(t)-sin(2*t)) - (-7), 2*(2*sin(t)-sin(2*t)) - (-7)];
%     P = [6, -6;
%          -7, -7];
%     neg_tan_theta = -(A(2,:,:)./A(1,:,:));
%     output = (P(2,:)+P(1,:).*neg_tan_theta)';
    global Sensor_num P;

    P_T = [2*(2*cos(t)-cos(2*t))+2;
           2*(2*sin(t)-sin(2*t))];

%     P_T = [2*cos(t);
%            2*sin(t)];

%     P = [6, -6, 2, -2;
%          -7, -7, -3, -3];
%     P = [12, 6, 0, -6;
%          -7, -7, -3, -3];
    delta = repmat(P_T,1,Sensor_num)-P;
    neg_tan_theta = -(delta(2,:)./delta(1,:));
    output = (P(2,:)+P(1,:).*neg_tan_theta)';
end


















%     P = [6, -6;
%          -7, -7];
%     
%     vecOne = [2*(2*cos(t)-cos(2*t))+2 - (6); 2*(2*cos(t)-cos(2*t))+2 - (-6)];
%     vecTwo = [2*(2*sin(t)-sin(2*t)) - (-7); 2*(2*sin(t)-sin(2*t)) - (-7)];
% 
%     temgTwo = -(vecTwo./vecOne);
    
%     P_num = [-1, -13];
%     P_2 = [-7,-7];
%     P_1 = [6,-6];
%     output = [(-1)*(((4*cos(t)-2*cos(2*t)-4)*(1+(t*0)/(4*sin(t)-2*sin(2*t)+7))));
%               (-13)*((4*cos(t)-2*cos(2*t)+8)*(1+(t*0)/(4*sin(t)-2*sin(2*t)+7)))];
%     output =[-7 + 6*(((4*cos(t)-2*cos(2*t)-4)*(1+(t*0)/(4*sin(t)-2*sin(2*t)+7))));
%              -7 + -6*((4*cos(t)-2*cos(2*t)+8)*(1+(t*0)/(4*sin(t)-2*sin(2*t)+7)))]';