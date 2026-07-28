function [cardVals] = finalAce1to11(cardVals)
    % ace1to11 as many aces as possible from 1 to 11 without busting
    for i = 1:length(cardVals)
        if cardVals(i) == 1 && sum(cardVals) + 10 <= 21
            % Only add 10 more since ace already counted as 1
            cardVals(i) = 11;
        end
    end
end

