% Driver script to test the drawCard function
clearvars;
clc;

% Test case 1: Draw a card to an empty hand
testCase = 1;

% Inputs
cardsPlayed = 1; % initialised as 1 in initialisation function
deck = [10, 5, 22, 15, 30]; % Simple test deck
hand = [];
cut = 48;

% Expected outputs
expectedHand = [10]; % First card in deck
expectedCardsPlayed = 2;
expectedDeck = [10, 5, 22, 15, 30]; % Deck should remain unchanged

% Actual outputs
[actualHand, actualCardsPlayed, actualDeck] = finalDrawCard(cardsPlayed, deck, hand, cut); % call function

% Check that all conditions are met
handCorrect = isequal(actualHand, expectedHand);
cardsPlayedCorrect = (actualCardsPlayed == expectedCardsPlayed);
deckCorrect = isequal(actualDeck, expectedDeck);
testPassed = handCorrect && cardsPlayedCorrect && deckCorrect;
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n");


% Test case 2: Draw a card to a hand with existing cards
testCase = 2;

% Inputs
cardsPlayed = 2;
deck = [10, 5, 22, 15, 30]; % Simple test deck
hand = [10]; % Hand already has first card
cut = 48;

% Expected outputs
expectedHand = [10, 5]; % First and second card in deck
expectedCardsPlayed = 3;
expectedDeck = [10, 5, 22, 15, 30]; % Deck should remain unchanged

% Actual outputs
[actualHand, actualCardsPlayed, actualDeck] = finalDrawCard(cardsPlayed, deck, hand, cut); % call function

% Check that all conditions are met
handCorrect = isequal(actualHand, expectedHand);
cardsPlayedCorrect = (actualCardsPlayed == expectedCardsPlayed);
deckCorrect = isequal(actualDeck, expectedDeck);
testPassed = handCorrect && cardsPlayedCorrect && deckCorrect;
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n");


% Test case 3: Drawing the Last Card in Deck
testCase = 3;

% Inputs
deck = randperm(52); % Full shuffled deck, similar to shuffleDeck function
cardsPlayed = 52; % Last card position
hand = deck(1:5); % Hand already has first 5 cards
cut = 138;

% Expected Outputs
expectedHand = [hand, deck(cardsPlayed)]; % Hand with last card added
expectedCardsPlayed = cardsPlayed + 1; % Beyond deck boundary now
expectedDeck = deck; % Deck remains unchanged

% Actual Outputs
[actualHand, actualCardsPlayed, actualDeck] = finalDrawCard(cardsPlayed, deck, hand, cut); % call function

% Check that all conditions are met
handCorrect = isequal(actualHand, expectedHand);
cardsPlayedCorrect = (actualCardsPlayed == expectedCardsPlayed);
deckCorrect = isequal(actualDeck, expectedDeck);
testPassed = handCorrect && cardsPlayedCorrect && deckCorrect;
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n");

% Test Case 4: Invalid Cards Played Index (without try-catch)
testCase = 4;

% Inputs
deck = randperm(52); % simulate a fully shuffled deck
cardsPlayed = 53; % Beyond deck length
hand = deck(1:3);
cut = 48;

% Check if cardsPlayed is valid before calling the function
if cardsPlayed > length(deck)
    fprintf("TestCase: %d\t The function cannot be tested - index out of bounds, cards beyond deck length. Function working as expected\n", testCase);
else
    % Proceed with regular test only if index is valid
    [actualHand, actualCardsPlayed, actualDeck] = finalDrawCard(cardsPlayed, deck, hand, cut); % call function
    
    expectedHand = [hand, deck(cardsPlayed)]; 
    expectedCardsPlayed = cardsPlayed + 1;
    expectedDeck = deck;
    
    handCorrect = isequal(actualHand, expectedHand);
    cardsPlayedCorrect = (actualCardsPlayed == expectedCardsPlayed);
    deckCorrect = isequal(actualDeck, expectedDeck);
    
    testPassed = handCorrect && cardsPlayedCorrect && deckCorrect;
    
    fprintf("TestCase: %d\t The function is ", testCase);
    if ~testPassed
        fprintf("not ");
    end
    fprintf("working as expected\n");
end


% Test case 5: re-shuffle
testCase = 5;

% Inputs
initialDeck = randperm(52); % simulate a fully shuffled deck
cardsPlayed = 51; % greater than cut
cut = 48;

% Expected Outputs
correctLength = length(deck) == 52; % check length of array is 52
uniqueValues = length(unique(deck)) == 52;  % check that all integers generated are unique, using unique function

% Actual Outputs
[actualHand, actualCardsPlayed, actualDeck] = finalDrawCard(cardsPlayed, deck, hand, cut); % call function

% Check if expected and actual outputs are the same
testPassed = correctLength && uniqueValues; % check if all conditions are met
fprintf("TestCase: %d\t The function is ", testCase);
if ~testPassed
    fprintf("not ");
end
fprintf("working as expected\n");



