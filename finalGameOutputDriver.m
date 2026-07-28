% Driver script to test the gameStatus function
% As checking displayed output can't be automated, the user is asked to
% check if expected output matches the actual output
clc;
clearvars;

% Test case 1: Mid-game (showDealer = false)
testCase = 1;
playerCardVals = [10, 7];
playerSuit = ["Hearts", "Diamonds"];
playerFaceCard = ["Queen", ""];
dealerCardVals = [5, 8, 6];
dealerSuit = ["Clubs", "Hearts", "Spades"];
dealerFaceCard = ["", "", ""];
showDealer = false;
gameOver = false;
playerBalance = 300;

fprintf("------ Test Case %d: Mid-game ------\n", testCase);
fprintf("Expected output: Dealer's first card hidden, player hand shown with count\n\n");
finalGameOutput(playerCardVals, playerSuit, dealerCardVals, dealerSuit, showDealer, gameOver, playerBalance, playerFaceCard, dealerFaceCard);

% Check if function output matches expected format
fprintf("\nTestCase: %d\t Is the function working as expected? Check if output shows:\n", testCase);
fprintf("- Only 1 dealer cards with '?' at the end\n");
fprintf("- Complete player hand, with one queen, with player count of 17\n\n");

% Test case 2: End of round (showDealer = true)
testCase = 2;
playerCardVals = [10, 8];
playerSuit = ["Spades", "Hearts"];
playerFaceCard = ["", ""];
dealerCardVals = [10, 9];
dealerSuit = ["Diamonds", "Clubs"];
dealerFaceCard = ["Jack", ""];
showDealer = true;
gameOver = false;
playerBalance = 450;

fprintf("------ Test Case %d: End of round ------\n", testCase);
fprintf("Expected output: Both hands fully shown with counts\n\n");
finalGameOutput(playerCardVals, playerSuit, dealerCardVals, dealerSuit, showDealer, gameOver, playerBalance, playerFaceCard, dealerFaceCard);

% Check if function output matches expected format
fprintf("\nTestCase: %d\t Check if output shows:\n", testCase);
fprintf("- Complete dealer hand, with a jack, with dealer count of 19\n");
fprintf("- Complete player hand with player count of 18\n\n");

% Test case 3: Game over state (finalOutput = true, with money left)
testCase = 3;
playerCardVals = [10, 5, 7];
playerSuit = ["Hearts", "Spades", "Diamonds"];
playerFaceCard = ["Jack", "", ""];
dealerCardVals = [10, 10];
dealerSuit = ["Clubs", "Hearts"];
dealerFaceCard = ["", "King"];
showDealer = true;
gameOver = true;
playerBalance = 100;

fprintf("------ Test Case %d: Game over with money ------\n", testCase);
fprintf("Expected output: No specific output since player still has money\n\n");
finalGameOutput(playerCardVals, playerSuit, dealerCardVals, dealerSuit, showDealer, gameOver, playerBalance, playerFaceCard, dealerFaceCard);

% Check if function output matches expected format
fprintf("\nTestCase: %d\t Check if output is empty\n\n", testCase);

% Test case 4: Game over state (finalOutput = true, no money left)
testCase = 4;
playerCardVals = [10, 9];
playerSuit = ["Diamonds", "Spades"];
playerFaceCard = ["", ""];
dealerCardVals = [8, 7, 6];
dealerSuit = ["Hearts", "Clubs", "Diamonds"];
dealerFaceCard = ["", "", ""];
showDealer = true;
gameOver = true;
playerBalance = 0;

fprintf("------ Test Case %d: Game over with no money ------\n", testCase);
fprintf("Expected output: Message indicating player has no money left\n\n");
finalGameOutput(playerCardVals, playerSuit, dealerCardVals, dealerSuit, showDealer, gameOver, playerBalance, playerFaceCard, dealerFaceCard);

% Check if function output matches expected format
fprintf("\nTestCase: %d\t Check if output shows:\n", testCase);
fprintf("- 'You have no more money left!' message\n\n");
