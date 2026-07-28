% Driver script to test the playerWager function
clc;
clearvars;

% Test case 1: valid wager of regular size
testCase = 1;

% Inputs
playerBalance = 500;
wagerInput = 100;

% Expected Output
expectedWager = 100;

% Actual Output
fprintf("----- Test Case %d ------\n", testCase);
fprintf("Enter %d when prompted for the wager\n", wagerInput);
wager = finalPlayerWager(playerBalance);

% Check if expected and actual outputs are the same
testPassed = (wager == expectedWager);
fprintf("\n\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n")


% Test case 2: valid wager of small size
testCase = 2;

% Inputs
playerBalance = 500;
wagerInput = 5;

% Expected Output
expectedWager = 5;

% Actual Output
fprintf("----- Test Case %d ------\n", testCase);
fprintf("Enter %d when prompted for the wager\n", wagerInput);
wager = finalPlayerWager(playerBalance);

% Check if expected and actual outputs are the same
testPassed = (wager == expectedWager);
fprintf("\n\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n")


% Test case 3: test invalid, then valid input
testCase = 3;
playerBalance = 500;
expectedWager = 400; % This is what the tester should input after the invalid input

fprintf("----- Test Case %d ------\n", testCase);
fprintf("Please first enter 550 (which should be rejected),\n");
fprintf("then enter %d when prompted again\n", expectedWager);
wager = finalPlayerWager(playerBalance);

% Check if expected and actual outputs are the same
testPassed = (wager == expectedWager);
fprintf("\n\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n")