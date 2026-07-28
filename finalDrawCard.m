function [hand, cardsPlayed, deck] = finalDrawCard(cardsPlayed, deck, hand, cut)
    % drawCard adds another card to a hand
    % shuffle hand if cards player is greater than cut
    if cardsPlayed >= cut
        [deck, cut] = finalShuffleDeck();
        cardsPlayed = 1;
        fprintf("Shuffling Cards ...\n\n");
    end

    % append a new card to the current hand
    hand(length(hand)+1) = deck(cardsPlayed);  % MATLAB Blackjack Project Demonstration - Code Overview and Test Game

    % update the cards played amount to reflect this
    cardsPlayed = cardsPlayed + 1;
end