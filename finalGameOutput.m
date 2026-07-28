function [] = finalGameOutput(playerCardVals, playerSuit, dealerCardVals, dealerSuit, showDealer, gameOver, playerBalance, playerFaceCard, dealerFaceCard)
    % gameStatus outputs the dealer/player hands to the command window
    clc; % clear command window for next output
    
    if ~gameOver 
        if ~showDealer % only display 1 card during players' turn. 
            fprintf("Dealer Hand:\n");
            for i = 2:2
                if dealerCardVals(i) == 1 || dealerCardVals(i) == 11
                    fprintf("Ace of %s", dealerSuit(i));
                elseif ~isempty(dealerFaceCard(i)) && dealerFaceCard(i) ~= "" % face card check
                    fprintf("%s of %s", dealerFaceCard(i), dealerSuit(i));
                else
                    fprintf("%d of %s", dealerCardVals(i), dealerSuit(i));
                end
                if i < length(dealerCardVals)
                    fprintf(", ");
                end
            end
            fprintf(" and ? of ?\n\n");
            
            fprintf("Player Hand:\n");
            for i = 1:length(playerCardVals)
                if playerCardVals(i) == 1 || playerCardVals(i) == 11
                    fprintf("Ace of %s", playerSuit(i));
                elseif ~isempty(playerFaceCard(i)) && playerFaceCard(i) ~= ""
                    fprintf("%s of %s", playerFaceCard(i), playerSuit(i));
                else
                    fprintf("%d of %s", playerCardVals(i), playerSuit(i));
                end
                if i < length(playerCardVals)
                    fprintf(", ");
                end
            end
            fprintf("\n");
            fprintf("Player Count: %d\n\n", sum(playerCardVals));

        else % show all cards when round ends
            fprintf("Dealer Hand:\n");
            for i = 1:length(dealerCardVals)
                if dealerCardVals(i) == 1 || dealerCardVals(i) == 11
                    fprintf("Ace of %s", dealerSuit(i));
                elseif ~isempty(dealerFaceCard(i)) && dealerFaceCard(i) ~= ""
                    fprintf("%s of %s", dealerFaceCard(i), dealerSuit(i));
                else
                    fprintf("%d of %s", dealerCardVals(i), dealerSuit(i));
                end
                if i < length(dealerCardVals)
                    fprintf(", ");
                end
            end
            fprintf("\n");
            fprintf("Dealer Count: %d\n\n", sum(dealerCardVals));
            
            fprintf("Player Hand:\n");
            for i = 1:length(playerCardVals)
                if playerCardVals(i) == 1 || playerCardVals(i) == 11
                    fprintf("Ace of %s", playerSuit(i));
                elseif ~isempty(playerFaceCard(i)) && playerFaceCard(i) ~= ""
                    fprintf("%s of %s", playerFaceCard(i), playerSuit(i));
                else
                    fprintf("%d of %s", playerCardVals(i), playerSuit(i));
                end
                if i < length(playerCardVals)
                    fprintf(", ");
                end
            end
            fprintf("\n");
            fprintf("Player Count: %d\n\n", sum(playerCardVals)); % Made consistent capitalization
        end
    else % final output
        if playerBalance == 0
            disp("You have no more money left!");
        end
    end
end
