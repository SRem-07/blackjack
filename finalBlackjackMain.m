% Blackjack game main script
% clear command window and workspace/variables
clc;
clearvars;

% Initialise highscores cell array
highScores = {};

% Game loop
while true % loop to allow restarting the game after running out of money
    % Ask for player's name (for high scores in future)
    fprintf("\n");
    playerName = input("Enter your name: ", "s");

    % Initialise variables used in the program
    [playerBalance, cardsPlayed, playerHand, playerCardVals, dealerHand, dealerCardVals, showDealer, gameOver, winLossCount] = finalInitialisation(playerName); % initialise variables
    highestBalance = playerBalance;
    
    while playerBalance > 0 % repeat game whilst player has money
        % First turn functions
        [deck, cut] = finalShuffleDeck(); % generate deck
        [wager] = finalPlayerWager(playerBalance); % get initial bet
    
        % Draw 2 cards for the player and dealer
        for i = 1:2
            [playerHand, cardsPlayed, deck] = finalDrawCard(cardsPlayed, deck, playerHand, cut);
            [dealerHand, cardsPlayed, deck] = finalDrawCard(cardsPlayed, deck, dealerHand, cut);
        end
    
        % Convert cards to their game value for player and dealer hand
        [playerCardVals, playerSuit, playerFaceCard] = finalCardConverter(playerHand); 
        [dealerCardVals, dealerSuit, dealerFaceCard] = finalCardConverter(dealerHand); 
    
        % Convert aces in player and dealer hand to value 11
        [playerCardVals] = finalAce1to11(playerCardVals);
        [dealerCardVals] = finalAce1to11(dealerCardVals);
    
        % Check if insurance is available to the player (if dealer shows ace)
        [dealerBlackjack, playerBalance, continueGame, winLossCount] = finalCheckInsurance(playerCardVals, dealerCardVals, playerSuit, dealerSuit, playerFaceCard, dealerFaceCard, playerBalance, wager, winLossCount);
    
        % If dealer has blackjack, reset hands and continue to next round
        if dealerBlackjack
            if ~continueGame
                % Update high scores with highest balance before exiting
                highScores = finalUpdateHighScores(highScores, playerName, highestBalance);
                break; % exit the main game loop if player doesn't want to play again
            end
            
            % Reset hands for next round
            playerHand = [];
            playerCardVals = [];
            dealerHand = [];
            dealerCardVals = [];
            continue; % skip to next iteration
        end
    
        % Check for blackjack using the function
        [hasBlackjack, playerBalance, continueGame, winLossCount] = finalCheckBlackjack(playerCardVals, dealerCardVals, playerSuit, dealerSuit, playerFaceCard, dealerFaceCard, playerBalance, wager, winLossCount);
        
        % If player has blackjack, reset hands and continue to next round
        if hasBlackjack
            if ~continueGame
                % Update high scores with highest balance before exiting
                highScores = finalUpdateHighScores(highScores, playerName, highestBalance);
                break; % exit the main game loop if player doesn't want to play again
            end
            
            % Reset hands for next round
            playerHand = [];
            playerCardVals = [];
            dealerHand = [];
            dealerCardVals = [];
            continue; % skip to next iteration
        end
    
        % Output current player cards and count and the second dealer card
        finalGameOutput(playerCardVals, playerSuit, dealerCardVals, dealerSuit, showDealer, gameOver, playerBalance, playerFaceCard, dealerFaceCard); % outputs game status
        
        % Ask player choice to hit, stand or double
        [choice, wager] = finalHitStandDouble(playerHand, wager, playerBalance);
    
        while strcmpi(choice, "hit") % run loop whilst player elects to 'hit'
            [playerHand, cardsPlayed, deck] = finalDrawCard(cardsPlayed, deck, playerHand, cut); % add another card to player hand
            [playerCardVals, playerSuit, playerFaceCard] = finalCardConverter(playerHand); % convert cards
            [playerCardVals] = finalAce1to11(playerCardVals); % converts aces to 11 if possible
            [playerCardVals] = finalAce11to1(playerCardVals); % converts aces of 11 to 1 if player will bust
            finalGameOutput(playerCardVals, playerSuit, dealerCardVals, dealerSuit, showDealer, gameOver, playerBalance, playerFaceCard, dealerFaceCard); % output cards and count
    
            if sum(playerCardVals) > 21 % if bust, exit loop
                break
            end
    
            % Ask for player's choice again
            [choice, wager] = finalHitStandDouble(playerHand, wager, playerBalance);
        end
    
        if strcmpi(choice, "double") % if the player elects to double
            [playerHand, cardsPlayed, deck] = finalDrawCard(cardsPlayed, deck, playerHand, cut); % add another card to player hand
            [playerCardVals, playerSuit, playerFaceCard] = finalCardConverter(playerHand); % convert cards
            [playerCardVals] = finalAce1to11(playerCardVals); % converts aces to 11 if possible
            [playerCardVals] = finalAce11to1(playerCardVals); % converts aces of 11 to 1 if player will bust
            finalGameOutput(playerCardVals, playerSuit, dealerCardVals, dealerSuit, showDealer, gameOver, playerBalance, playerFaceCard, dealerFaceCard); % outputs cards and count
    
            % Output message
            fprintf("You have doubled!\n");
        end
    
        % If player is not bust, continue dealer functions
        if sum(playerCardVals) <= 21
            % Add cards when dealer hand is less or equal to 16, or on soft 17
           while sum(dealerCardVals) <= 16 || (sum(dealerCardVals) == 17 && any(dealerCardVals == 11))
                [dealerHand, cardsPlayed, deck] = finalDrawCard(cardsPlayed, deck, dealerHand, cut); % add card to dealer hand
                [dealerCardVals, dealerSuit, dealerFaceCard] = finalCardConverter(dealerHand); % convert cards
                [dealerCardVals] = finalAce1to11(dealerCardVals); % convert aces to 11 if possible
                [dealerCardVals] = finalAce11to1(dealerCardVals); % convert aces of 11 to 1 if dealer will bust
            end
            
            % Output full hands to the user
            showDealer = true; % change boolean to fully output dealer hand
            finalGameOutput(playerCardVals, playerSuit, dealerCardVals, dealerSuit, showDealer, gameOver, playerBalance, playerFaceCard, dealerFaceCard); % output cards and count with full dealer hand
            showDealer = false; % change boolean back for later games
        end
    
 
        % Calculate the outcom of the game
        [playerBalance, playerHand, playerCardVals, dealerHand, dealerCardVals, winLossCount] = finalWinCalculator(playerCardVals, dealerCardVals, playerBalance, wager, winLossCount);
        
        % Update highest balance, if applicable
        if playerBalance > highestBalance
            highestBalance = playerBalance;
            fprintf("\nNew highscore!: %d\n", highestBalance);
        end
        
    
        % Ask the player if they want to play again using the new function
        continueGame = finalAskPlayAgain();
        if ~continueGame
            % Update high scores with highest balance before exiting
            highScores = finalUpdateHighScores(highScores, playerName, highestBalance);
            break; % exit the main game loop
        end
    end
    
   % Update high scores
   highScores = finalUpdateHighScores(highScores, playerName, highestBalance);

   % Display game over message, and ask if player wants to see leaderboard
   fprintf("\nGame over! %s's final balance: %d, highest score: %d\n", playerName, playerBalance, highestBalance);
   playerLeaderboard = input("Do you want see the leaderboard? (yes/no): ", "s");
        if strcmpi(playerLeaderboard, "yes")
            % Display leaderboard
            if ~isempty(highScores)
                % Extract names and scores
                names = highScores(:, 1);
                rawScores = highScores(:, 2);
            
                % Convert scores to numeric
                scores = zeros(size(rawScores));
                for i = 1:length(rawScores)
                    val = rawScores{i};
                    if ischar(val) || isstring(val)
                        val = str2double(val);
                    end
                    if isnumeric(val) && isscalar(val)
                        scores(i) = val;
                    else
                        scores(i) = NaN;  % handle invalid entries 
                    end
                end
            
                % Sort scores descending
                [~, sortIdx] = sort(scores, 'descend');
                sortedNames = names(sortIdx);
                sortedScores = scores(sortIdx);
            
                % Create and display table
                leaderboard = table(sortedNames, sortedScores, 'VariableNames', {'Name', 'Balance'});
                fprintf("\nHighscores:");
                disp(leaderboard);
            else
                disp("No high scores yet.");
            end
        end
   
    % Ask if the player wants to restart after running out of money
    if playerBalance <= 0 && continueGame
        fprintf("\nYou're out of money!\n");
        restart = input("Do you want to play again? (yes/no): ", "s");
        if ~strcmpi(restart, "yes")
            break; % exit full outer loop if user doesn't want to restart
        end
    else
        break; % break out of outer loop if they chose to stop or enter invalid input
    end
end