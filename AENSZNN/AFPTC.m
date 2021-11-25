% 有限时间收敛激活函数
function output = AFPTC(E, t)
    for i = 1 : length(E)
        if t < 3
            E(i) = (exp(E(i))-1)./((3-t).*exp(E(i)));
        end
    end

    for i = 1:length(E)
        output(i) = E(i);
    end
end


