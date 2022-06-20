mapping (address => uint256) public balanceOf;

event Transfer(address indexed from, address indexed to, uint256 value);

function _transfer(address _from, address _to, uint _value) internal {
    require(_to != 0x0);
    require(balanceOf[_from] >= _value);
    balanceOf[_from] -= _value;
    balanceOf[_to] += _value;
    Transfer(_from, _to, _value);
}

function sell(uint256 amount) public {
    require(this.balance >= amount * sellPrice);
    _transfer(msg.sender, this, amount);              
    msg.sender.transfer(amount * sellPrice);          
}

function sendTokens(address _to, uint value) public {
    _transfer(msg.sender,_to,value);
    msg.sender.transfer(value * sellPrice);         
}

function buy() payable public {
    uint amount = (msg.value / buyPrice) * 1 wei;       
    _transfer(this, msg.sender, amount);              
}
