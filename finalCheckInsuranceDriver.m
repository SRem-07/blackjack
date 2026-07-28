% Driver for the checkInsurance function
clc;
clearvars;

% Test case 1: Player takes insurance, dealer has blackjack, player doesn't
testCase = 1;

% Inputs
playerCardVals = [10, 7];
dealerCardVals = [10, 11]; % Ace showing, has blackjack
playerSuit = ["Hearts", "Spades"];
dealerSuit = ["Diamonds", "Clubs"];
playerFaceCard = ["King", ""];
dealerFaceCard = ["", "King"];
playerBalance = 1000;
wager = 200;
winLossCount = [0,0];

% Expected Outputs
expectedDealerBlackjack = true;
expectedPlayerBalance = 900; % Lose 200 wager, lose 100 insurance but win 200 insurance payout
expectedContinueGame = true;

% Actual Outputs
fprintf("------ Test Case: %d ------\n", testCase);
fprintf("When prompted for insurance, enter 'yes'\n");
fprintf("When asked if you want to play again, enter 'yes'\n\n");
[actualDealerBlackjack, actualPlayerBalance, actualContinueGame] = finalCheckInsurance(playerCardVals, dealerCardVals, playerSuit, dealerSuit, playerFaceCard, dealerFaceCard, playerBalance, wager, winLossCount);

% Check if expected and actual outputs are the same
testPassed = (expectedDealerBlackjack == actualDealerBlackjack) && (expectedPlayerBalance == actualPlayerBalance) && (expectedContinueGame == actualContinueGame);
fprintf("\n\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");


% Test case 2: Player takes insurance, dealer doesn't have blackjack
testCase = 2;

% Inputs
playerCardVals = [10, 7];
dealerCardVals = [6, 11]; % Ace showing, no blackjack
playerSuit = ["Hearts", "Spades"];
dealerSuit = ["Diamonds", "Clubs"];
playerFaceCard = ["King", ""];
dealerFaceCard = ["", ""];
playerBalance = 1000;
wager = 200;
winLossCount = [0,0];

% Expected Outputs
expectedDealerBlackjack = false;
expectedPlayerBalance = 900; % Lose 100 on insurance
expectedContinueGame = true;

% Actual Outputs
fprintf("------ Test Case: %d ------\n", testCase);
fprintf("When prompted for insurance, enter 'yes'\n\n");
[actualDealerBlackjack, actualPlayerBalance, actualContinueGame] = finalCheckInsurance(playerCardVals, dealerCardVals, playerSuit, dealerSuit, playerFaceCard, dealerFaceCard, playerBalance, wager, winLossCount);

% Check if expected and actual outputs are the same
testPassed = (expectedDealerBlackjack == actualDealerBlackjack) && (expectedPlayerBalance == actualPlayerBalance) && (expectedContinueGame == actualContinueGame);
fprintf("\n\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");


% Test case 3: Player declines insurance, dealer has blackjack
testCase = 3;

% Inputs
playerCardVals = [10, 8];
dealerCardVals = [10, 11]; % Ace showing, has blackjack
playerSuit = ["Hearts", "Spades"];
dealerSuit = ["Diamonds", "Clubs"];
playerFaceCard = ["King", ""];
dealerFaceCard = ["", "King"];
playerBalance = 1000;
wager = 200;
winLossCount = [0,0];

% Expected Outputs
expectedDealerBlackjack = true;
expectedPlayerBalance = 800; % Lose 200 wager
expectedContinueGame = true;

% Actual Outputs
fprintf("------ Test Case: %d ------\n", testCase);
fprintf("When prompted for insurance, enter 'no'\n");
fprintf("When asked if you want to play again, enter 'yes'\n\n");
[actualDealerBlackjack, actualPlayerBalance, actualContinueGame] = finalCheckInsurance(playerCardVals, dealerCardVals, playerSuit, dealerSuit, playerFaceCard, dealerFaceCard, playerBalance, wager, winLossCount);

% Check if expected and actual outputs are the same
testPassed = (expectedDealerBlackjack == actualDealerBlackjack) && (expectedPlayerBalance == actualPlayerBalance) && (expectedContinueGame == actualContinueGame);
fprintf("\n\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");


% Test case 4: Function should not offer insurance
testCase = 4;

% Inputs
playerCardVals = [10, 8];
dealerCardVals = [10, 8]; % No Ace showing
playerSuit = ["Hearts", "Spades"];
dealerSuit = ["Diamonds", "Clubs"];
playerFaceCard = ["King", ""];
dealerFaceCard = ["King", ""];
playerBalance = 1000;
wager = 200;
winLossCount = [0,0];

% Expected Outputs
expectedDealerBlackjack = false;
expectedPlayerBalance = 1000; % No change
expectedContinueGame = true;

% Actual Outputs
fprintf("------ Test Case: %d ------\n", testCase);
fprintf("The function should not prompt for insurance\n\n");
[actualDealerBlackjack, actualPlayerBalance, actualContinueGame] = finalCheckInsurance(playerCardVals, dealerCardVals, playerSuit, dealerSuit, playerFaceCard, dealerFaceCard, playerBalance, wager, winLossCount);

% Check if expected and actual outputs are the same
testPassed = (expectedDealerBlackjack == actualDealerBlackjack) && (expectedPlayerBalance == actualPlayerBalance) && (expectedContinueGame == actualContinueGame);
fprintf("\n\n");
fprintf("Testcase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n\n");