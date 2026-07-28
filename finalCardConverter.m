function [cardVals, suit, faceCard] = finalCardConverter(hand)
    % cardConverter assigns a card to the integer in a hand
    for i = 1:length(hand) % iterate through hand size
        % For 3 decks, use mod to find equivalent card in a single deck
        % If the card number is a multiple of 52, we need to handle it specially
        singleDeckCard = mod(hand(i), 52);
        if singleDeckCard == 0
            singleDeckCard = 52; % If mod result is 0, it's equivalent to card 52
        end
        
        % Now use the single deck card value to determine suit and value
        % Hearts
        if singleDeckCard > 0 && singleDeckCard < 14 % MATLAB Blackjack Project Demonstration - Code Overview and Test Game
            suit(i) = "Hearts";
            if singleDeckCard >= 1 && singleDeckCard <= 10
                cardVals(i) = singleDeckCard;
                faceCard(i) = "";
            elseif singleDeckCard == 11 % jack
                cardVals(i) = 10;
                faceCard(i) = "Jack";
            elseif singleDeckCard == 12 % queen
                cardVals(i) = 10;
                faceCard(i) = "Queen";
            elseif singleDeckCard == 13 % king
                cardVals(i) = 10;
                faceCard(i) = "King";
            end
        % Diamonds
        elseif singleDeckCard > 13 && singleDeckCard < 27
            suit(i) = "Diamonds";
            if singleDeckCard >= 14 && singleDeckCard <= 23
                cardVals(i) = singleDeckCard - 13; % subtract 13 to get value between 1 and 10 (inclusive)
                faceCard(i) = "";
            elseif singleDeckCard == 24
                cardVals(i) = 10;
                faceCard(i) = "Jack";
            elseif singleDeckCard == 25
                cardVals(i) = 10;
                faceCard(i) = "Queen";
            elseif singleDeckCard == 26
                cardVals(i) = 10;
                faceCard(i) = "King";
            end
        % Spades
        elseif singleDeckCard > 26 && singleDeckCard < 40
            suit(i) = "Spades";
            if singleDeckCard >= 27 && singleDeckCard <= 36
                cardVals(i) = singleDeckCard - 26; % subtract 26 to get value between 1 and 10 (inclusive)
                faceCard(i) = "";
            elseif singleDeckCard == 37
                cardVals(i) = 10;
                faceCard(i) = "Jack";
            elseif singleDeckCard == 38
                cardVals(i) = 10;
                faceCard(i) = "Queen";
            elseif singleDeckCard == 39
                cardVals(i) = 10;
                faceCard(i) = "King";
            end
        % Clubs
        elseif singleDeckCard > 39
            suit(i) = "Clubs";
            if singleDeckCard >= 40 && singleDeckCard <= 49
                cardVals(i) = singleDeckCard - 39; % subtract 39 to get value between 1 and 10 (inclusive)
                faceCard(i) = "";
            elseif singleDeckCard == 50
                cardVals(i) = 10;
                faceCard(i) = "Jack";
            elseif singleDeckCard == 51
                cardVals(i) = 10;
                faceCard(i) = "Queen";
            elseif singleDeckCard == 52
                cardVals(i) = 10;
                faceCard(i) = "King";
            end
        end
    end