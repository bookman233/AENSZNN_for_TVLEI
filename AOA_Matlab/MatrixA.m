function output = MatrixA(t)
%     P_T = [2*(2*cos(t)-cos(2*t))+2;
%            2*(2*sin(t)-sin(2*t))];
%     P = [6, -6;
%          -7, -7];
%     delta = repmat(P_T,1,2)-P;
%     neg_tan_theta = -(delta(2,:)./delta(1,:));
%     output = [neg_tan_theta; ones(1,2)]';
    global Sensor_num P;

    P_T = [2*(2*cos(t)-cos(2*t))+2;
           2*(2*sin(t)-sin(2*t))];
       
%     P_T = [2*cos(t);
%            2*sin(t)];
       
%     P = [12, 6, 0, -6;
%          -7, -7, -3, -3];
    delta = repmat(P_T,1,Sensor_num)-P;
    neg_tan_theta = -(delta(2,:)./delta(1,:));
    output = [neg_tan_theta; ones(1,Sensor_num)]';
end

