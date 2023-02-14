function buyNFT() external payable {
    require(msg.value == 0.001 ether);
    uint index = randArrayIndex(randNonce); 
    _mint(msg.sender, athletes[index].id, 1, "");
}
