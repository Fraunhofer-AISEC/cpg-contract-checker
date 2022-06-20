function reset(uint256 maxNumOfElements) public ownerOnly {
    uint256 numOfElements = maxNumOfElements;

    if (numOfElements > playersAddressList.length)
        numOfElements = playersAddressList.length;

    for (uint256 i = 0; i < numOfElements; i++) {
        address element = playersAddressList[playersAddressList.length - 1];
        delete players[element];
        players.pop();
    }
}
