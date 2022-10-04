function getOwnCards() external view returns(uint[] memory _cards) {
    uint[] memory result = new uint[](userToCardsCount[msg.sender]);
    uint counter = 0;
    for (uint i = 0; i < cards.length; i++) {
        if (cardIdToUser[i] == msg.sender) {
            result[counter] = cards[i];
            counter++;
        }
    }
    return result;
}
