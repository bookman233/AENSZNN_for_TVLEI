function dotu=RightSide_OZNN(t,u)
    A = MatrixA(t); 
    DotA = DiffA(t);
    b = Matrixb(t); 
    Dotb = Diffb(t);
    C = MatrixC(t); 
    DotC = DiffC(t);
    d = Matrixd(t); 
    Dotd = Diffd(t);
    [m_A,n_A] = size(A); 
    [m_C,n_C] = size(C);
    D = zeros(m_C);
    u_temp = u(1:5);
    inte = u(6:8);
    for i = 1 : m_C
        D(i,i) = u_temp(n_A + i);
    end
    M = [A,zeros(m_A,m_C);C,2*D];
    N = [DotA,zeros(m_A,m_C);DotC,zeros(m_C)];
    W = [A,zeros(m_A,m_C);C,D];
    q = [b;d]; 
    Dotq = [Dotb;Dotd];
    err = W * u_temp - q;
    noise_con = [2;2;2];
    noise_rand = 1.5*rand(3,1)+0.5;
    noise_linear = 0.4*[t,t,t]';
%    activat_err = AFMhyperbplicsine(err);
%    activat_err = (err);
%     activat_err = err;
    PM = pinv(M);
    dotu = -PM * (N * u_temp - Dotq + 5 * err + noise_rand);
    dotu = [dotu; err];
    t

