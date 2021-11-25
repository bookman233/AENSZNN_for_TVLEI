function Dotb = Diffb(t)
    syms s; 
    b = Matrixb(s);
    Dot = diff(b); 
    s = t; 
    Dotb = eval(Dot);