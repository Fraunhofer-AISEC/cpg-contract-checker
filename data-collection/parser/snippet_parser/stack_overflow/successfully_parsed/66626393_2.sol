function deposit() public onlyBuyer payable {
    require(currentState == State.AWAITING_FUNDS);
    uint256 amount = msg.value;


    
    
    uint256 fee = (amount / 100) * 3;
    payable(contractOwner).transfer(fee); 
    amount -= fee; 


    deposits[seller] = deposits[seller] + amount; 
    currentState = State.AWAITING_CLAIM;
}
