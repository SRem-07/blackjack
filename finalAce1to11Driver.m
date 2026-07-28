% Driver file for the ace1to11 function
clearvars;
clc;

% Test Case 1: One ace converted
testCase = 1;

% Inputs
cardVals = [1, 10];

% Expected Output
expectedCardVals = [11, 10];

% Actual Output
[actualCardVals] = finalAce1to11(cardVals);

% Check if expected and actual outputs are the same
testPassed = (expectedCardVals == actualCardVals);
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n")


% Test Case 2: No ace converted
testCase = 2;

% Inputs
cardVals = [2, 10];

% Expected Output
expectedCardVals = [2, 10];

% Actual Output
[actualCardVals] = finalAce1to11(cardVals);

% Check if expected and actual outputs are the same
testPassed = (expectedCardVals == actualCardVals);
fprintf("\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n")


% Test Case 3: Two aces in the hand, only one converted
testCase = 3;

% Inputs
cardVals = [1, 1];

% Expected Output
expectedCardVals = [11, 1];

% Actual Output
[actualCardVals] = finalAce1to11(cardVals);

% Check if expected and actual outputs are the same
testPassed = (expectedCardVals == actualCardVals);
fprintf("\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n")

% Test Case 4: Hand greater than 2 cards
testCase = 4;

% Inputs

cardVals = [5, 8, 1];

% Expected Output
expectedCardVals = [5, 8, 1];

% Actual Output
[actualCardVals] = finalAce1to11(cardVals);

% Check if expected and actual outputs are the same
testPassed = (expectedCardVals == actualCardVals);
fprintf("\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n")


% Test Case 5: Hand greater than 2 cards, still converting
testCase = 5;

% Inputs

cardVals = [2, 8, 1];

% Expected Output
expectedCardVals = [2, 8, 11];

% Actual Output
[actualCardVals] = finalAce1to11(cardVals);

% Check if expected and actual outputs are the same
testPassed = (expectedCardVals == actualCardVals);
fprintf("\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n")