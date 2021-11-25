function output = AFBallSaturation(E)

    for i = 1 : length(E)
        if norm(E(i)) > 1
            E(i) = E(i)./norm(E(i));
        end
%         if norm(E(i)) <= 1
%             E(i) = E(i);
%         end
    end
    
    for i = 1:length(E)
        output(i) = E(i);
    end
end


