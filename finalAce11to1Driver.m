% Driver file for the ace1to11 function
clearvars;
clc;

% Test Case 1: One ace converted
testCase = 1;

% Inputs
cardVals = [11, 9, 5];

% Expected Output
expectedCardVals = [1, 9, 5];

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
cardVals = [11, 10];

% Expected Output
expectedCardVals = [11, 10];

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


% Test Case 3: Two aces in the hand of value 11, only one converted
testCase = 3;

% Inputs
cardVals = [11, 11];

% Expected Output
expectedCardVals = [1, 11];

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

