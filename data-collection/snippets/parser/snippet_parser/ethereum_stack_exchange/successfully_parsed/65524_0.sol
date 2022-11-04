contract Token {
    function transfer(address _receiver, uint amount) public returns (bool);
    function balanceOf(address receiver)public returns(uint);
    function approve(address spender, uint tokens) public returns (bool);
    function transferFrom(address from, address to, uint tokens) public returns (bool);
}

function withdraw() public {
    tokenAddress = Token(_tokenAddress)
    tokenAddress.approve.transferFrom(msg.sender, address(this), _amount);
}

function approve(uint _ammount, address _tokenAddress) public{
    tokenAddress = Token(_tokenAddress)
    tokenAddress.approve(adress(this), _amoount);
}
