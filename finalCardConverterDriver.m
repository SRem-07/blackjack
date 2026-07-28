% Driver script to test the cardConverter function
clc;
clearvars;


% Test Case 1: 7 of Spades in the second deck
testCase = 1;

% Inputs
inputHand = 85;

% Expected Outputs
expectedCardVals = 7;
expectedSuit = "Spades";
expectedFaceCard = "";

% Actual Output
[actualCardVals, actualSuit, actualFaceCard] = finalCardConverter(inputHand);

% Check if expected and actual outputs are the same
testPassed = (expectedCardVals == actualCardVals) && (strcmp(expectedSuit, actualSuit)) && (strcmp(expectedFaceCard, actualFaceCard));
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n");



% Test Case 2: Ace of Diamonds in the third deck
testCase = 2;

% Inputs
inputHand = 118;

% Expected Outputs
expectedCardVals = 1;
expectedSuit = "Diamonds";
expectedFaceCard = "";

% Actual Output
[actualCardVals, actualSuit, actualFaceCard] = finalCardConverter(inputHand);

% Check if expected and actual outputs are the same
testPassed = (expectedCardVals == actualCardVals) && (strcmp(expectedSuit, actualSuit)) && (strcmp(expectedFaceCard, actualFaceCard));
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n");
% Note: realHand could later be turned from 1 to 11


% Test Case 3: Queen of Clubs in the second deck (Face Card test)
testCase = 3;

% Inputs
inputHand = 103;

% Expected Outputs
expectedCardVals = 10;
expectedSuit = "Clubs";
expectedFaceCard = "Queen";

% Actual Output
[actualCardVals, actualSuit, actualFaceCard] = finalCardConverter(inputHand);

% Check if expected and actual outputs are the same
testPassed = (expectedCardVals == actualCardVals) && (strcmp(expectedSuit, actualSuit)) && (strcmp(expectedFaceCard, actualFaceCard));
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n");