% Driver for the updateHighScores function
clc;
clearvars;

% Test case 1: Add a new player to the high scores list
testCase = 1;

% Inputs
highScores = {'Alice', 1000; 'Bob', 800; 'Charlie', 650};
playerName = 'David';
currentPlayerBalance = 750;

% Expected Outputs
expectedHighScores = {'Alice', 1000; 'Bob', 800; 'Charlie', 650; 'David', 750};

% Actual Outputs
fprintf("------ Test Case: %d ------\n", testCase);
fprintf("Adding a new player to high scores\n\n");
fprintf("Initial High Scores:\n");
displayHighScores(highScores);
actualHighScores = finalUpdateHighScores(highScores, playerName, currentPlayerBalance);
fprintf("\nUpdated High Scores:\n");
displayHighScores(actualHighScores);

% Check if expected and actual outputs are the same
testPassed = isSameHighScores(expectedHighScores, actualHighScores);
fprintf("\nTestcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");

% Test case 2: Update an existing player's score with a higher value
testCase = 2;

% Inputs
highScores = {'Alice', 1000; 'Bob', 800; 'Charlie', 650};
playerName = 'Bob';
currentPlayerBalance = 1200;

% Expected Outputs
expectedHighScores = {'Alice', 1000; 'Bob', 1200; 'Charlie', 650};

% Actual Outputs
fprintf("------ Test Case: %d ------\n", testCase);
fprintf("Updating existing player's score with higher value\n\n");
fprintf("Initial High Scores:\n");
displayHighScores(highScores);
actualHighScores = finalUpdateHighScores(highScores, playerName, currentPlayerBalance);
fprintf("\nUpdated High Scores:\n");
displayHighScores(actualHighScores);

% Check if expected and actual outputs are the same
testPassed = isSameHighScores(expectedHighScores, actualHighScores);
fprintf("\nTestcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");

% Test case 3: Try updating an existing player with a lower score (should not update)
testCase = 3;

% Inputs
highScores = {'Alice', 1000; 'Bob', 800; 'Charlie', 650};
playerName = 'Alice';
currentPlayerBalance = 500;

% Expected Outputs (should remain unchanged)
expectedHighScores = {'Alice', 1000; 'Bob', 800; 'Charlie', 650};

% Actual Outputs
fprintf("------ Test Case: %d ------\n", testCase);
fprintf("Attempt to update with lower score (should not change)\n\n");
fprintf("Initial High Scores:\n");
displayHighScores(highScores);
actualHighScores = finalUpdateHighScores(highScores, playerName, currentPlayerBalance);
fprintf("\nUpdated High Scores:\n");
displayHighScores(actualHighScores);

% Check if expected and actual outputs are the same
testPassed = isSameHighScores(expectedHighScores, actualHighScores);
fprintf("\nTestcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");

% Test case 4: Case insensitive name matching
testCase = 4;

% Inputs
highScores = {'Alice', 1000; 'Bob', 800; 'Charlie', 650};
playerName = 'bob';  % Lowercase, should match "Bob"
currentPlayerBalance = 950;

% Expected Outputs
expectedHighScores = {'Alice', 1000; 'Bob', 950; 'Charlie', 650};

% Actual Outputs
fprintf("------ Test Case: %d ------\n", testCase);
fprintf("Testing case insensitive name matching\n\n");
fprintf("Initial High Scores:\n");
displayHighScores(highScores);
actualHighScores = finalUpdateHighScores(highScores, playerName, currentPlayerBalance);
fprintf("\nUpdated High Scores:\n");
displayHighScores(actualHighScores);

% Check if expected and actual outputs are the same
testPassed = isSameHighScores(expectedHighScores, actualHighScores);
fprintf("\nTestcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");

% Test case 5: Empty high scores list
testCase = 5;

% Inputs
highScores = {};
playerName = 'First';
currentPlayerBalance = 500;

% Expected Outputs
expectedHighScores = {'First', 500};

% Actual Outputs
fprintf("------ Test Case: %d ------\n", testCase);
fprintf("Adding to an empty high scores list\n\n");
fprintf("Initial High Scores:\n");
displayHighScores(highScores);
actualHighScores = finalUpdateHighScores(highScores, playerName, currentPlayerBalance);
fprintf("\nUpdated High Scores:\n");
displayHighScores(actualHighScores);

% Check if expected and actual outputs are the same
testPassed = isSameHighScores(expectedHighScores, actualHighScores);
fprintf("\nTestcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");

% Helper function to display high scores
function displayHighScores(scores)
    if isempty(scores)
        fprintf("No high scores available.\n");
        return;
    end
    
    fprintf("%-15s %s\n", "Player", "Score");
    fprintf("-------------------------\n");
    for i = 1:size(scores, 1)
        fprintf("%-15s %d\n", scores{i, 1}, scores{i, 2});
    end
end

% Helper function to check if two high score tables are the same
function result = isSameHighScores(expected, actual)
    if size(expected, 1) ~= size(actual, 1)
        result = false;
        return;
    end
    
    result = true;
    for i = 1:size(expected, 1)
        if ~strcmpi(expected{i, 1}, actual{i, 1}) || expected{i, 2} ~= actual{i, 2}
            result = false;
            return;
        end
    end
end