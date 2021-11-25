function output=RightSide_RACZNN(t,x, gamma, lambda)
    global Sensor_num;
    A = MatrixA(t);
    b = MatrixB(t);
    dotA = DiffA(t);
    dotb = DiffB(t);

    x_cur = x(1:2);
    inte = x(3:Sensor_num+2);
    
    err = A*x_cur-b;
    momentum = norm(err);

    scal_param_one = (momentum^5 + gamma);
    scal_param_two = (5^(norm(inte)) + lambda);

    dotx = pinv(A)*(-dotA*x_cur+dotb-scal_param_one * err- lambda * inte + 5);
%     dotx = pinv(A)*(-dotA*x_cur+dotb-10 * err-10 * inte);
    output = [dotx;err];
    t
end
