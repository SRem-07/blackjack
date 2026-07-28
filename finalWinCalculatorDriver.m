% Driver script to test the winCalculator function
clc;
clearvars;

% Test Case 1: Player Busts
testCase = 1;

% Inputs
playerBalance = 500;
wager = 250;
playerCardVals = [10, 10, 3];
dealerCardVals = [8, 10];
winLossCount = [0, 0];

% Expected Outputs
expectedPlayerBalance = 250;
expectedPlayerHand = [];
expectedPlayerCardVals = [];
expectedDealerHand = [];
expectedDealerCardVals = [];

% Actual Outputs
fprintf("------ Test Case %d ------\n", testCase);
[actualPlayerBalance, actualPlayerHand, actualRealPlayerHand, actualDealerHand, actualRealDealerHand] = finalWinCalculator(playerCardVals, dealerCardVals, playerBalance, wager, winLossCount);

% Check if expected and actual outputs are the same
testPassed = (expectedPlayerBalance == actualPlayerBalance) && ... % Use isequal function to compare arrays element by element
             isequal(expectedPlayerHand, actualPlayerHand) && ...
             isequal(expectedPlayerCardVals, actualRealPlayerHand) && ...
             isequal(expectedDealerHand, actualDealerHand) && ...
             isequal(expectedDealerCardVals, actualRealDealerHand);
fprintf("\nTestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");


% Test Case 2: Dealer Busts
testCase = 2;

% Inputs
playerBalance = 500;
wager = 250;
playerCardVals = [10, 10];
dealerCardVals = [8, 10, 5];
winLossCount = [0, 0];

% Expected Outputs
expectedPlayerBalance = 750;
expectedPlayerHand = [];
expectedPlayerCardVals = [];
expectedDealerHand = [];
expectedDealerCardVals = [];

% Actual Outputs
fprintf("------ Test Case %d ------\n", testCase);
[actualPlayerBalance, actualPlayerHand, actualRealPlayerHand, actualDealerHand, actualRealDealerHand] = finalWinCalculator(playerCardVals, dealerCardVals, playerBalance, wager, winLossCount);

% Check if expected and actual outputs are the same
testPassed = (expectedPlayerBalance == actualPlayerBalance) && ... % Use isequal function to compare arrays element by element
             isequal(expectedPlayerHand, actualPlayerHand) && ...
             isequal(expectedPlayerCardVals, actualRealPlayerHand) && ...
             isequal(expectedDealerHand, actualDealerHand) && ...
             isequal(expectedDealerCardVals, actualRealDealerHand);
fprintf("\nTestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");


% Test Case 3: Player Wins, hand is better than dealer's
testCase = 3;

% Inputs
playerBalance = 500;
wager = 250;
playerCardVals = [10, 10];
dealerCardVals = [8, 10];
winLossCount = [0, 0];

% Expected Outputs
expectedPlayerBalance = 750;
expectedPlayerHand = [];
expectedPlayerCardVals = [];
expectedDealerHand = [];
expectedDealerCardVals = [];

% Actual Outputs
fprintf("------ Test Case %d ------\n", testCase);
[actualPlayerBalance, actualPlayerHand, actualRealPlayerHand, actualDealerHand, actualRealDealerHand] = finalWinCalculator(playerCardVals, dealerCardVals, playerBalance, wager, winLossCount);

% Check if expected and actual outputs are the same
testPassed = (expectedPlayerBalance == actualPlayerBalance) && ... % Use isequal function to compare arrays element by element
             isequal(expectedPlayerHand, actualPlayerHand) && ...
             isequal(expectedPlayerCardVals, actualRealPlayerHand) && ...
             isequal(expectedDealerHand, actualDealerHand) && ...
             isequal(expectedDealerCardVals, actualRealDealerHand);
fprintf("\nTestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");


% Test Case 4: A Draw
testCase = 4;

% Inputs
playerBalance = 500;
wager = 250;
playerCardVals = [10, 8];
dealerCardVals = [8, 10];
winLossCount = [0, 0];

% Expected Outputs
expectedPlayerBalance = 500;
expectedPlayerHand = [];
expectedPlayerCardVals = [];
expectedDealerHand = [];
expectedDealerCardVals = [];

% Actual Outputs
fprintf("------ Test Case %d ------\n", testCase);
[actualPlayerBalance, actualPlayerHand, actualRealPlayerHand, actualDealerHand, actualRealDealerHand] = finalWinCalculator(playerCardVals, dealerCardVals, playerBalance, wager, winLossCount);

% Check if expected and actual outputs are the same
testPassed = (expectedPlayerBalance == actualPlayerBalance) && ... % Use isequal function to compare arrays element by element
             isequal(expectedPlayerHand, actualPlayerHand) && ...
             isequal(expectedPlayerCardVals, actualRealPlayerHand) && ...
             isequal(expectedDealerHand, actualDealerHand) && ...
             isequal(expectedDealerCardVals, actualRealDealerHand);
fprintf("\nTestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");


% Test Case 5: Dealer hand beats player hand
testCase = 5;

% Inputs
playerBalance = 500;
wager = 250;
playerCardVals = [10, 5];
dealerCardVals = [8, 10];
winLossCount = [0, 0];

% Expected Outputs
expectedPlayerBalance = 250;
expectedPlayerHand = [];
expectedPlayerCardVals = [];
expectedDealerHand = [];
expectedDealerCardVals = [];

% Actual Outputs
fprintf("------ Test Case %d ------\n", testCase);
[actualPlayerBalance, actualPlayerHand, actualRealPlayerHand, actualDealerHand, actualRealDealerHand] = finalWinCalculator(playerCardVals, dealerCardVals, playerBalance, wager, winLossCount);

% Check if expected and actual outputs are the same
testPassed = (expectedPlayerBalance == actualPlayerBalance) && ... % Use isequal function to compare arrays element by element
             isequal(expectedPlayerHand, actualPlayerHand) && ...
             isequal(expectedPlayerCardVals, actualRealPlayerHand) && ...
             isequal(expectedDealerHand, actualDealerHand) && ...
             isequal(expectedDealerCardVals, actualRealDealerHand);
fprintf("\nTestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");