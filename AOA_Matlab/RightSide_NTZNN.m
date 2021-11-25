function output=RightSide_NTZNN(t,x, gamma, lambda)
    A = MatrixA(t);
    b = MatrixB(t);
    dotA = DiffA(t);
    dotb = DiffB(t);
    x_length = length(x);
    half = (x_length/2);
    x_cur = x(1:half);
    inte = x(half+1:x_length);

%     A = testA(t);
%     b = testB(t);
%     dotA = test_DiffA(t);
%     dotb = test_DiffB(t);

%     err = A*x-b;
%     dotx = pinv(A)*(-dotA*x+dotb-err);

    err = A*x_cur-b;
    dotx = pinv(A)*(-dotA*x_cur+dotb-gamma * err-lambda * inte);
    output = [dotx;err];
    t
end
