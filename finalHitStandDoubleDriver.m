% Driver script to test the playerChoice function
clearvars;
clc;

% Test case 1: Valid input "hit"
testCase = 1;

% Inputs
playerHand = [10, 1];
wager = 100;
playerBalance = 1000;

% Expected Outputs
expectedChoice = "hit"; % This is what the tester should input
expectedWager = 100;

% Inputs
fprintf("------ Test Case %d ------\n", testCase);
fprintf('Please enter "%s" when prompted\n', expectedChoice);
[choice, wager] = finalHitStandDouble(playerHand, wager, playerBalance);

% Check if expected and actual outputs are the same
testPassed = strcmpi(expectedChoice, choice) && (expectedWager == wager);
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");


% Test case 2: Valid input "stand"
testCase = 2;

% Inputs
playerHand = [10, 1, 2];
wager = 100;
playerBalance = 1000;

% Expected Outputs
expectedChoice = "stand"; 
expectedWager = 100;

fprintf("------ Test Case %d ------\n", testCase);
fprintf('Please enter "%s" when prompted\n', expectedChoice);
[choice, wager] = finalHitStandDouble(playerHand, wager, playerBalance);

% Check if expected and actual outputs are the same
testPassed = strcmpi(expectedChoice, choice) && (expectedWager == wager);
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");


% Test case 3: Invalid input followed by valid input
testCase = 3;

% Inputs
playerHand = [10, 1, 2];
wager = 100;

% Expected Output
expectedChoice = "stand"; 
expectedWager = 100;
playerBalance = 1000;

% Inputs
fprintf("------ Test Case %d ------\n", testCase);
fprintf('Please first enter "Stay" (which should be rejected),\n');
fprintf('then enter "%s" when prompted again\n', expectedChoice);
[choice, wager] = finalHitStandDouble(playerHand, wager, playerBalance);

% Check if expected and actual outputs are the same
testPassed = strcmpi(expectedChoice, choice) && (expectedWager == wager);
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");


% Test case 4: Case sensitivity test
testCase = 4;

% Inputs
playerHand = [10, 1, 2];
wager = 100;
playerBalance = 1000;

% Expected Outputs
expectedChoice = "hit"; 
expectedWager = 100;

% Inputs
fprintf("------ Test Case %d ------\n", testCase);
fprintf('Please first enter "Hit" with capital H,\n');
fprintf('If rejected, then enter "%s" with lowercase\n', expectedChoice);
fprintf("The input should not be rejected if function is working as expected.\n");
[choice, wager] = finalHitStandDouble(playerHand, wager, playerBalance);

% Check if expected and actual outputs are the same
testPassed = strcmpi(expectedChoice, choice) && (expectedWager == wager);
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");


% Test case 5: Double
testCase = 5;

% Inputs
playerHand = [10, 3];
wager = 200;
playerBalance = 1000;

% Expected Outputs
expectedChoice = "double";
expectedWager = 400;

% Actual Outputs
% Inputs
fprintf("------ Test Case %d ------\n", testCase);
fprintf('Please enter "%s" when prompted\n', expectedChoice);
[choice, wager] = finalHitStandDouble(playerHand, wager, playerBalance);

% Check if expected and actual outputs are the same
testPassed = strcmpi(expectedChoice, choice) && (expectedWager == wager);
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");
