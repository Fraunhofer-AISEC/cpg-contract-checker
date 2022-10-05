
function buyIt() public payable {
    
    require(msg.value == price);

    
    owner.transfer(msg.value);

    
    owner = msg.sender;
}
