function getCardsByOwner(address user) external view returns(uint[] memory _cards) {
    uint[] memory result = new uint[](userToCardsCount[user]);
    uint counter = 0;
    for (uint i = 0; i < cards.length; i++) {
        if (cardIdToUser[i] == user) {
            result[counter] = cards[i];
            counter++;
        }
    }
    return result;
}
