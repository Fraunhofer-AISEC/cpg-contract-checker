function depositParty (uint amount) public payable {
    require (daitoken.balanceOf(msg.sender) >= amount);
    accountBalance [msg.sender] += amount;
    daitoken.transferFrom(msg.sender, address(this), amount);
}