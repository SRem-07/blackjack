function [isBlackjack, playerBalance, continueGame, winLossCount] = finalCheckBlackjack(playerCardVals, dealerCardVals, playerSuit, dealerSuit, playerFaceCard, dealerFaceCard, playerBalance, wager, winLossCount)
    % checkBlackjack checks if the player has blackjack. If they do, they
    % get a congratulatory message and a payout of 3:2
    % This is the function for the final version
    isBlackjack = false;
    continueGame = true;
    
    % Check if player has blackjack (21 with first two cards)
    if sum(playerCardVals) == 21 && length(playerCardVals) == 2
        isBlackjack = true;
        playerBalance = playerBalance - wager;
        
        % Display full dealer hand when player has blackjack
        showDealer = true;
        finalOutput = false;
        finalGameOutput(playerCardVals, playerSuit, dealerCardVals, dealerSuit, showDealer, finalOutput, playerBalance, playerFaceCard, dealerFaceCard);
        
        % Check if dealer also has blackjack (push)
        if sum(dealerCardVals) == 21 && length(dealerCardVals) == 2
            playerBalance = playerBalance + wager;
            fprintf('\nBoth player and dealer have Blackjack! Push! bet returned.\n');

             % Change and display win-loss count
             fprintf("You have won %d rounds. You have lost %d rounds\n\n", winLossCount(1), winLossCount(2));
        else
            % Player wins with blackjack - 3:2 payout
            blackjackPayout = wager * 1.5;
            playerBalance = playerBalance + wager + blackjackPayout;
            fprintf('\nBLACKJACK! You win %.1f (3:2 payout)!\n', blackjackPayout);

            % Play sound for Blackack
            load('gong.mat', 'y', 'Fs');
            sound(y, Fs);

            % Change and display win-loss count
            winLossCount(1) = winLossCount(1) + 1; 
            fprintf("You have won %d rounds. You have lost %d rounds\n\n", winLossCount(1), winLossCount(2));
        end
        
        % Ask if player wants to play again using the askPlayAgain function
        continueGame = finalAskPlayAgain();
    end
end
