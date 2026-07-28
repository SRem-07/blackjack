function [choice, wager] = finalHitStandDouble(playerHand, wager, playerBalance)
    % playerChoice prompts the user to decide to hit or stand
    while true % run while valid input hasn't been inputted
        if length(playerHand) == 2 && playerBalance >= wager * 2
            choice = string(input("Hit, Stand or Double? ", "s")); % get input for initial choice
            fprintf("\n");

            if strcmpi(choice, 'double')
                wager = wager * 2;
            end
    
            if strcmpi(choice, "hit") || strcmpi(choice, "stand") || strcmpi(choice, 'double')
                break; % valid choice, exit loop
            else
                fprintf('Invalid input. Please enter "hit", "stand" or "double".\n');
            end

        else
            choice = string(input("Hit or Stand? ", "s")); % get input for initial choice
            fprintf("\n");
            if strcmpi(choice, "hit") || strcmpi(choice, "stand")
                break; % valid choice, exit loop
            else
                  fprintf('Invalid input. Please enter "hit" or "stand".\n');
            end
        end
    end
end