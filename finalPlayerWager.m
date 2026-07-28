function [wager] = finalPlayerWager(playerBalance)
    % playerWager initializes the wager and checks if it is a valid input
    fprintf("\nYour balance is: %d\n", playerBalance)

    while true
        wager = input("How much do you want to wager? ");
      
        if ~(wager <= playerBalance && wager > 0) % invalid wager
            fprintf("Please enter a valid wager\n"); % prompt user to enter a valid wager
        else
            break; % exit loop on valid wager
        end
    end
end
