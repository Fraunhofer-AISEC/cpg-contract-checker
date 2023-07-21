uint[99999999] private cards;



function findCardRarity(uint _randNum) internal returns (string memory) {

            uint cardRemainder = findCardRemainder(_randNum);
            
            if (cardRemainder < 10) {
                return "unique";
            } else if (10 <= cardRemainder < 10010) {
                return "legendary";
            } else if (10010 <= cardRemainder < 1010010) {
                return "rare";
            } else if (1010010 <= cardRemainder < 11010010) {
                return "uncommon";
            } else {
                return "common";
            }
}