% Driver script to test the initialisation function 
% Only one test case is required 
clc;
clearvars;

% Test case information
testCase = 1;

% Inputs
playerName = "Sam";

% Expected outputs for each variable
expectedPlayerBalance = 500;
expectedCardsPlayed = 1;
expectedPlayerHand = [];
expectedPlayerCardVals= [];
expectedDealerHand = [];
expectedPlayerCardVals = [];
expectedShowDealer = false;
expectedGameOver = false;
expectedWinLossCount = [0, 0];

% Call the initialisation function
[playerBalance, cardsPlayed, playerHand, realPlayerHand, dealerHand, realDealerHand, showDealer, gameOver, winLossCount] = finalInitialisation(playerName);

% Check if all test conditions are met
testPassed = (playerBalance == expectedPlayerBalance) && ... % spaced out to format well
             (cardsPlayed == expectedCardsPlayed) && ...
             isempty(playerHand) && ...
             isempty(realPlayerHand) && ...
             isempty(dealerHand) && ...
             isempty(realDealerHand) && ...
             (showDealer == expectedShowDealer) && ...
             (gameOver == expectedGameOver) && ...
             isequal(winLossCount, [0, 0]);

% Display results
fprintf("\nTestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n");