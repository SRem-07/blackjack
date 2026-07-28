function [continueGame] = finalAskPlayAgain()
    % askPlayAgain asks the player if they want to play again after a round
    % has finished
    continueGame = true;
    
    while true
        playAgain = input('Do you want to play again? (yes/no): ', 's');
        if strcmpi(playAgain, 'no')
            continueGame = false;
            break; % Exit the loop
        elseif strcmpi(playAgain, 'yes')
            break; % Exit the loop, continue the game
        else
            fprintf('Invalid input. Please enter "yes" or "no".\n');
        end
    end
end

