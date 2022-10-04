function sendEth(string memory url) public payable{
    require(msg.value >= minLimit, "Pay more than the minimum limit");
}
