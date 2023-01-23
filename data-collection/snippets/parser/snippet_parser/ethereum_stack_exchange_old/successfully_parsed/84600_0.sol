uint wagerAmount;

function placeBet(uint _wager, address payable _address1, address payable _address2) external payable {
    require(msg.sender == _address1 || msg.sender == _address2);
    require(msg.value > 0);
    if (wagerAmount == 0) {
        
        wagerAmount = msg.value;
    }
    else {
        require(wagerAmount == msg.value);
        
    }
}
