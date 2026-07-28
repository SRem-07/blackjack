function [updatedScores] = finalUpdateHighScores(highScores, playerName, currentPlayerBalance)
    % updateHighScores updates the highscores, and names, of the player
    playerIndex = 0;
    for i = 1:size(highScores, 1) 
        if strcmpi(highScores{i, 1}, playerName)
            playerIndex = i;
            break;
        end
    end
    
    % Update or add the player's score
    if playerIndex > 0
        % Only update if new score is higher
        if currentPlayerBalance > highScores{playerIndex, 2}
            highScores{playerIndex, 2} = currentPlayerBalance;
        end
    else
        % Add new player
        highScores{end+1, 1} = playerName; % store name
        highScores{end, 2} = currentPlayerBalance; % store score
    end
    
    updatedScores = highScores;
end
