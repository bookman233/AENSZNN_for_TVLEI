function DotC = DiffC(t)
    syms s; 
    C = MatrixC(s);
    Dot = diff(C); 
    s = t; 
    DotC = eval(Dot);
