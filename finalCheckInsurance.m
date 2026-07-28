function [dealerBlackjack, playerBalance, continueGame, winLossCount] = finalCheckInsurance(playerCardVals, dealerCardVals, playerSuit, dealerSuit, playerFaceCard, dealerFaceCard, playerBalance, wager, winLossCount)
    % checkInsurance checks if the dealer has an ace as the second card
    % then asks the player if they want insurace if true
    % This is the function for the final version
    dealerBlackjack = false;
    continueGame = true;

    % Check if dealer is showing an Ace
    for i = 2:length(dealerCardVals)
        if dealerCardVals(i) == 11  % Dealer shows an Ace
            fprintf("The dealer has an Ace showing.\n");

            insuranceVal = wager / 2;
            playerTookInsurance = false;

            % Offer insurance only if the player can afford it
            if playerBalance - wager >= insuranceVal
                while true
                    playerInsurance = input('Do you want to take insurance? (yes/no): ', 's');
                    if strcmpi(playerInsurance, 'yes') || strcmpi(playerInsurance, 'no')
                        break;
                    else
                        fprintf('Invalid input. Please enter "yes" or "no".\n');
                    end
                end

                if strcmpi(playerInsurance, 'yes')
                    playerBalance = playerBalance - insuranceVal;
                    playerTookInsurance = true;
                else
                    fprintf("You have not chosen to pay for insurance.\n");
                end
            else
                fprintf("You don't have enough balance to take insurance.\n");
            end

            % Now check if dealer has blackjack
            if sum(dealerCardVals) == 21 && length(dealerCardVals) == 2
                dealerBlackjack = true;
                playerBalance = playerBalance - wager;
                
                % Output to the player
                showDealer = true;
                finalOutput = false;
                finalGameOutput(playerCardVals, playerSuit, dealerCardVals, dealerSuit, showDealer, finalOutput, playerBalance, playerFaceCard, dealerFaceCard);

                if sum(playerCardVals) == 21 && length(playerCardVals) == 2
                    % Push with blackjack
                    playerBalance = playerBalance + wager;
                    if playerTookInsurance
                        playerBalance = playerBalance + 2 * insuranceVal;
                        fprintf('\nBoth player and dealer have Blackjack! Push! Bet returned with insurance payout.\n');
                    else
                        fprintf('\nBoth player and dealer have Blackjack! Push! Bet returned.\n');
                    end
                else
                    if playerTookInsurance
                        playerBalance = playerBalance + 2 * insuranceVal;
                        fprintf('\nDealer has Blackjack! You lose your wager but win the insurance bet.\n');
                    else
                        fprintf('\nDealer has Blackjack! You lose your wager.\n');
                    end
                    winLossCount(2) = winLossCount(2) + 1;
                end

                fprintf("You have won %d rounds. You have lost %d rounds\n\n", winLossCount(1), winLossCount(2));

                continueGame = finalAskPlayAgain();
            elseif playerTookInsurance
                fprintf('\nDealer does not have Blackjack. You lose your insurance bet.\n');
            end

            break; % Only need to check the first visible ace
        end
    end
end
