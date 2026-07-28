% Driver for the askPlayAgain function

% Clear command window and workspace
clc;
clear;

fprintf('------ TESTING askPlayAgain FUNCTION ------\n\n');

% Test Case 1: User enters 'yes'
testCase = 1;
fprintf('------ Test Case %d: User enters "yes" ------\n', testCase);
fprintf('When prompted, please enter "yes"\n\n');

% Expected Output
expectedContinueGame = true;

% Actual Output
actualContinueGame = finalAskPlayAgain();

% Check if expected and actual outputs match
testPassed = (expectedContinueGame == actualContinueGame);
fprintf('\nTest Case %d: ', testCase);
if testPassed
    fprintf('PASSED - Function correctly returned true when user entered "yes"\n\n');
else
    fprintf('FAILED - Expected %d but got %d\n\n', expectedContinueGame, actualContinueGame);
end

% Test Case 2: User enters 'no'
testCase = 2;
fprintf('------ Test Case %d: User enters "no" ------\n', testCase);
fprintf('When prompted, please enter "no"\n\n');

% Expected Output
expectedContinueGame = false;

% Actual Output
actualContinueGame = finalAskPlayAgain();

% Check if expected and actual outputs match
testPassed = (expectedContinueGame == actualContinueGame);
fprintf('\nTest Case %d: ', testCase);
if testPassed
    fprintf('PASSED - Function correctly returned false when user entered "no"\n\n');
else
    fprintf('FAILED - Expected %d but got %d\n\n', expectedContinueGame, actualContinueGame);
end

% Test Case 3: User enters invalid input then 'yes'
testCase = 3;
fprintf('------ Test Case %d: User enters invalid input then "yes" ------\n', testCase);
fprintf('When prompted, please enter an invalid input and then enter "yes"\n\n');

% Expected Output
expectedContinueGame = true;

% Actual Output
actualContinueGame = finalAskPlayAgain();

% Check if expected and actual outputs match
testPassed = (expectedContinueGame == actualContinueGame);
fprintf('\nTest Case %d: ', testCase);
if testPassed
    fprintf('PASSED - Function correctly returned true after handling invalid input\n\n');
else
    fprintf('FAILED - Expected %d but got %d\n\n', expectedContinueGame, actualContinueGame);
end

% Test Case 4: Case insensitivity test
testCase = 4;
fprintf('------ Test Case %d: Case insensitivity test ------\n', testCase);
fprintf('When prompted, please enter "YES" (all caps)\n\n');

% Expected Output
expectedContinueGame = true;

% Actual Output
actualContinueGame = finalAskPlayAgain();

% Check if expected and actual outputs match
testPassed = (expectedContinueGame == actualContinueGame);
fprintf('\nTest Case %d: ', testCase);
if testPassed
    fprintf('PASSED - Function correctly handled case insensitivity\n\n');
else
    fprintf('FAILED - Expected %d but got %d\n\n', expectedContinueGame, actualContinueGame);
end

