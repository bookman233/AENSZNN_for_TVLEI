function Dotd = Diffd(t)
    syms s; 
    d = Matrixd(s);
    Dot = diff(d); 
    s = t; 
    Dotd = eval(Dot);