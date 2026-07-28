function [playerBalance, cardsPlayed, playerHand, playerCardVals, dealerHand, dealerCardVals, showDealer, gameOver, winLossCount] = finalInitialisation(playerName)
    % initialisation creates variables required later in the progra
    % create player balance
    % This is the function for the final version
    playerBalance = 500;

    % Ask if the player wants to see the rules
    fprintf("\nWelcome to MATLAB Blackjack %s!\n", playerName);
    seeRules = input("Would you like to see the rules of Blackjack? (yes/no): ", 's');
    
    if strcmpi(seeRules, 'yes')
        % Display the rules of Blackjack to the player
        fprintf("\n--- Blackjack Rules ---\n");
        fprintf("1. The goal is to get as close to 21 as possible without going over.\n");
        fprintf("2. Face cards (Jack, Queen, King) are worth 10. Aces are worth 1 or 11. All other cards are worth their face values.\n");
        fprintf("3. You start with two cards and may choose to:\n");
        fprintf("   - 'Hit': Take another card.\n");
        fprintf("   - 'Stand': Keep your current hand.\n");
        fprintf("   - 'Double': Double your wager, take exactly one more card, then stand (only available with two starting cards).\n");
        fprintf("4. If the dealer's face-up card is an Ace, you will be offered 'insurance'.\n");
        fprintf("   - Insurance costs half your wager and pays 2:1 if the dealer has Blackjack.\n");
        fprintf("5. If you and the dealer both get Blackjack, it's a push (tie).\n");
        fprintf("6. The dealer must hit until reaching 16. They will also hit on a 'soft 17' (a 17 that includes an Ace counted as 11).\n");
        fprintf("------------------------\n\n");

        % Pause further output for 3 seconds so player can read rules
        pause(3);
    end

    % initialise other variables
    cardsPlayed = 1;
    playerHand = [];
    playerCardVals = [];
    dealerHand = [];
    dealerCardVals = [];
    showDealer = false;
    gameOver = false;
    winLossCount = zeros(1, 2);
end
