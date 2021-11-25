function output = DiffB(t)
    syms u;
    B = MatrixB(u);
    DotB = diff(B);
    u=t;
    output = eval(DotB);
