function [cardVals] = finalAce11to1(cardVals)
    % ace11to1 converts aces from value 11 to 1 if player will bust
      for i = 1:length(cardVals)
        if cardVals(i) == 11 && sum(cardVals) > 21 % change back to one for soft hand if will bust with current hand
           % Change ace card value to 1
            cardVals(i) = 1;
        end
    end
end