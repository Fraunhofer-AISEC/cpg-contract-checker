function getFlatDB() payable public returns (uint256[]) {
    uint256[] memory array = new uint256[](8);
    for (uint i=0; i<8; i++) {
        array[i] = flatDB[i].priceInWei;
    }
    return array;
}
