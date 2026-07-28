function [playerBalance, playerHand, playerCardVals, dealerHand, dealerCardVals, winLossCount] = finalWinCalculator(playerCardVals, dealerCardVals, playerBalance, wager, winLossCount)
    % winCalculator compares the player and dealer hands to calculate
    % winner and output winnings
    % This is the function for the final version
    playerBalance = playerBalance - wager; % calculate balance after wager
    sumPlayerHand = sum(playerCardVals); % calculate the value of the player's hand
    sumDealerHand = sum(dealerCardVals); % calculate the value of the dealer's hand

    % display the counts of both player and dealer to command window
    fprintf("Player Count: %d\tDealer Count: %d\n", sum(playerCardVals), sum(dealerCardVals));

    % calculate winnings for different scenarios
    if sumPlayerHand > 21 % player busts
        fprintf("Bust!\n");
        fprintf("The Dealer Wins! Your balance is now: %d\n", playerBalance);

        % Change and display win-loss count
        winLossCount(2) = winLossCount(2) + 1; 
        fprintf("You have won %d rounds. You have lost %d rounds\n\n", winLossCount(1), winLossCount(2));

    elseif sumDealerHand > 21 % dealer busts
        playerBalance = playerBalance + 2 * wager; % return winnings into player's balance
        fprintf("The Dealer Busts!\n");
        fprintf("You Win! Your balance is now: %d\n", playerBalance);

        % Change and display win-loss count
        winLossCount(1) = winLossCount(1) + 1; 
        fprintf("You have won %d rounds. You have lost %d rounds\n\n", winLossCount(1), winLossCount(2));

    elseif sumPlayerHand > sumDealerHand % player hand beats dealer hand
        playerBalance = playerBalance + 2 * wager;
        fprintf("You Win!\n");

        % Change and display win-loss count
        winLossCount(1) = winLossCount(1) + 1; 
        fprintf("You have won %d rounds. You have lost %d rounds\n\n", winLossCount(1), winLossCount(2));
        
    elseif sumPlayerHand == sumDealerHand % push
        playerBalance = playerBalance + wager; % 'push' return wager to player's balance
        fprintf("It's a Push! Your balance is now: %d\n", playerBalance);

        % Change and display win-loss count
        fprintf("You have won %d rounds. You have lost %d rounds\n\n", winLossCount(1), winLossCount(2));

    else
        fprintf("The Dealer Wins! Your balance is now: %d\n\n", playerBalance); % dealer hand beats player hand

        % Change and display win-loss count
        winLossCount(2) = winLossCount(2) + 1; 
        fprintf("You have won %d rounds. You have lost %d rounds\n\n", winLossCount(1), winLossCount(2));

    end
    fprintf("\n");

    % reinitialise variables to reset game status for next game
    playerHand = [];
    playerCardVals = [];
    dealerHand = [];
    dealerCardVals = [];

end