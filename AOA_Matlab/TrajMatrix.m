function A = TrajMatrix(t)
    A = [2*(2*cos(t)-cos(2*t))+2;
         2*(2*sin(t)-sin(2*t))];
end