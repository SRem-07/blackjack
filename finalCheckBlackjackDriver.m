% Driver for the checkBlackjack function
clc;
clearvars;

% Test case 1: player has blackjack
testCase = 1;

% Inputs
playerCardVals = [10, 11];
dealerCardVals = [9, 1];
playerSuit = ["Hearts", "Spades"];
dealerSuit = ["Diamonds", "Clubs"];
playerFaceCard = ["King", ""];
dealerFaceCard = ["", ""];
playerBalance = 400;
wager = 200;
winLossCount = [0, 0];

% Expected Outputs
expectedIsBlackjack = true;
expectedPlayerBalance = 700;
expectedContinueGame = true;

% Actual Outputs
fprintf("------ Test Case: %d ------\n", testCase);
fprintf("When asked if you want to play again, enter 'yes'\n\n");
[actualIsBlackjack, actualPlayerBalance, actualContinueGame] = finalCheckBlackjack(playerCardVals, dealerCardVals, playerSuit, dealerSuit, playerFaceCard, dealerFaceCard, playerBalance, wager, winLossCount);

% Check if expected and actual outputs are the same
testPassed = (expectedIsBlackjack == actualIsBlackjack) && (expectedPlayerBalance == actualPlayerBalance) && (expectedContinueGame == actualContinueGame);
fprintf("\n\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n")


% Test case 2: player doesn't blackjack
testCase = 2;

% Inputs
playerCardVals = [10, 10];
dealerCardVals = [9, 1];
playerSuit = ["Hearts", "Spades"];
dealerSuit = ["Diamonds", "Clubs"];
playerFaceCard = ["King", ""];
dealerFaceCard = ["", ""];
playerBalance = 400;
wager = 200;
winLossCount = [0, 0];

% Expected Outputs
expectedIsBlackjack = false;
expectedPlayerBalance = 400;
expectedContinueGame = true;

% Actual Outputs
fprintf("------ Test Case: %d ------\n", testCase);
fprintf("The function will not output anything to the command window if running as expected\n\n");
[actualIsBlackjack, actualPlayerBalance, actualContinueGame] = finalCheckBlackjack(playerCardVals, dealerCardVals, playerSuit, dealerSuit, playerFaceCard, dealerFaceCard, playerBalance, wager, winLossCount);

% Check if expected and actual outputs are the same
testPassed = (expectedIsBlackjack == actualIsBlackjack) && (expectedPlayerBalance == actualPlayerBalance) && (expectedContinueGame == actualContinueGame);
fprintf("\n\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n")


% Test case 3: A push (dealer and player both have blackjack)
testCase = 3;

% Inputs
playerCardVals = [10, 11];
dealerCardVals = [10, 11];
playerSuit = ["Hearts", "Spades"];
dealerSuit = ["Diamonds", "Clubs"];
playerFaceCard = ["King", ""];
dealerFaceCard = ["Queen", ""];
playerBalance = 400;
wager = 200;
winLossCount = [0, 0];

% Expected Outputs
expectedIsBlackjack = true;
expectedPlayerBalance = 400;
expectedContinueGame = true;

% Actual Outputs
fprintf("------ Test Case: %d ------\n", testCase);
fprintf("When asked if you want to play again, enter 'yes'\n\n");
[actualIsBlackjack, actualPlayerBalance, actualContinueGame] = finalCheckBlackjack(playerCardVals, dealerCardVals, playerSuit, dealerSuit, playerFaceCard, dealerFaceCard, playerBalance, wager, winLossCount);

% Check if expected and actual outputs are the same
testPassed = (expectedIsBlackjack == actualIsBlackjack) && (expectedPlayerBalance == actualPlayerBalance) && (expectedContinueGame == actualContinueGame);
fprintf("\n\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");