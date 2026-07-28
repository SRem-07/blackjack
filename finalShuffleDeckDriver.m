% Driver script to test the shuffleDeck function
clc;
clearvars;

% Test case 1
testCase = 1;

% Actual Output
[deck, cut] = finalShuffleDeck();

% Expected Output
correctLength = length(deck) == 156; % check the length of the array is 52
uniqueValues = length(unique(deck)) == 156; % check that all integers generated are unique, using unique function
allInRange = all(deck >= 1 & deck <= 156); % check that all integers generated are between 1 and 52
cutRange = (cut >= 134 && cut <= 148); % check that the cut is between 42 and 50

% Check if expected and actual outputs are the same
testPassed = correctLength && uniqueValues && allInRange && cutRange; % check if all conditions are met
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n");

% Test case 2
testCase = 2;

% Actual Output
[deck, cut] = finalShuffleDeck();

% Expected OUtput
correctLength = length(deck) == 156;
uniqueValues = length(unique(deck)) == 156;
allInRange = all(deck >= 1 & deck <= 156);
cutRange = (cut >= 134 && cut <= 148);

% Check if expected and actual outputs are the same
testPassed = correctLength && uniqueValues && allInRange && cutRange; 
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n");

% Test case 3
testCase = 3;
% Actual Output
[deck, cut] = finalShuffleDeck();

% Expected Outputs
correctLength = length(deck) == 156;
uniqueValues = length(unique(deck)) == 156;
allInRange = all(deck >= 1 & deck <= 156);
cutRange = (cut >= 134 && cut <= 148);

% Check if expected and actual outputs are the same
testPassed = correctLength && uniqueValues && allInRange && cutRange; 
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n");


% Compare if all three decks are different (which they should be if random)
deck1 = finalShuffleDeck();
deck2 = finalShuffleDeck();
deck3 = finalShuffleDeck();
allDifferent = ~isequal(deck1, deck2) && ~isequal(deck1, deck3) && ~isequal(deck2, deck3);

fprintf("\nThe three shuffles ");
if ~allDifferent
    fprintf("did not ");
end
fprintf("produce different deck arrangements\n");