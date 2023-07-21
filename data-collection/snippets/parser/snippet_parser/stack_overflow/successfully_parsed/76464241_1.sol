struct Card{
    uint cardNumber;
    string rarity;
} 

Card[] public cards;

function assignRarity(_cardId) internal {
    uint cardRemainder = findCardRemainder(_randNum);
            
    if (cardRemainder < 10) {
        cards[_cardId].rarity = "unique";
    } else if (10 <= cardRemainder < 10010) {
        cards[_cardId].rarity = "legendary";
    } else if (10010 <= cardRemainder < 1010010) {
        cards[_cardId].rarity = "rare";
    } else if (1010010 <= cardRemainder < 11010010) {
        cards[_cardId].rarity = "uncommon";
    } else {
        cards[_cardId].rarity = "common";
        }
    }


