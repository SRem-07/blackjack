function [deck, cut] = finalShuffleDeck()
    % deck generates an array of 52 unique integers
    % from MATLAB Blackjack Project Demonstration - Code Overview and Test Game
    deck = randperm(156); % creates an array of 156 numbers, 1:156, in a random order with no repetition of integers

    % generate cut (when to shuffle deck)
    cut = randi([134, 148]);
end
