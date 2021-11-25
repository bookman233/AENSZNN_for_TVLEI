function output=RightSide_RACZNN_bounded(t,x,gamma,mu)

    A = MatrixA(t);
    b = MatrixB(t);
    dotA = DiffA(t);
    dotb = DiffB(t);
    x_length = length(x);
    half = (x_length/2);
    x_cur = x(1:half);
    
    inte = x(half+1:x_length);
    err = A * x_cur - b;
    
    noise_con = [5;5];
%     noise_rand = -4*rand(3,1)+2;
%     noise_linear = 2*[t,t,t]';
    
    activated_err = gamma*AF_Adaptive(err);
    activated_inte = mu*AF_Adaptive(err+inte);

    dotX = pinv(A)*(-dotA*x_cur+dotb-activated_err - activated_inte + noise_con);

    output = [dotX;activated_err];
    t
end
