function dotx=RightSide_OZNN(t,x, gamma)
    A = MatrixA(t);
    b = MatrixB(t);
    dotA = DiffA(t);
    dotb = DiffB(t);

%     A = testA(t);
%     b = testB(t);
%     dotA = test_DiffA(t);
%     dotb = test_DiffB(t);

    err = gamma*(A*x-b);
    
    noise_con = [5;5];
    
    dotx = pinv(A)*(-dotA*x+dotb-err + 4);
    t
end
