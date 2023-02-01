for(uint256 i=0; i < addressArray.length; i++) {
    address payable addr = addressArray[i];
    addr.transfer(1 ether);
}
