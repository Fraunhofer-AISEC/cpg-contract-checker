for(uint256 i=0; i < addressArray.length; i++) {
    address payable addr = addressArray[i];
    (bool sent, bytes memory data) = addr.call{value: 1 ether}("");
    require(sent, "Failed to send Ether");
}
