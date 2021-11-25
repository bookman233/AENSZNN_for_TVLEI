function F_norm(u0)
    tspan = [0 15];
    options = odeset();
    [t, u] = ode45(@ZnnRight, tspan, u0, options);
     
  % [t, u] = ode45(@RightSide_OZNN, tspan, u0, options);
 
  % [t, u] = ode45(@RightSide_NBZNN, tspan, u0, options);

 %  [t, u] = ode45(@RightSide_PTCZNN, tspan, u0, options);
    max_val = 0;
    average_val = 0;
    cout_val = 0;
    for j = 1:length(t)
        T = t(j);
        A = MatrixA(T);
        b = Matrixb(T);
        C = MatrixC(T);
        d = Matrixd(T);
        [m_A,n_A] = size(A); 
        [m_C,n_C] = size(C);
        D = zeros(m_C);
        for i = 1 : m_C
            D(i,i) = u(j, (n_A + i));
        end
        W = [A,zeros(m_A,m_C);C,D];
        q = [b;d];
        u_temp = u(j, 1:5).';
%       err(:,j) = W * u(j, :).' - q;
        err(:,j) = W * u_temp - q;
        nerr(j) = norm(err(:,j));
        
        if T > 3
             average_val = average_val + nerr(j);
       end

        if T > 9
                if nerr(j) > max_val
                max_val = nerr(j);
            end
        end
        cout_val = cout_val + 1;
    end
    
    ASSRE = (average_val / cout_val)
    MSSRE = max_val        

    
  %  txt = {'||{\itE}(t)||_F'};
   % text(1,4,txt)
   txt = {'{\itt} (s)'};
    text(27,0.3,txt)
    plot(t, nerr, 'LineWidth', 2);
    hold on;