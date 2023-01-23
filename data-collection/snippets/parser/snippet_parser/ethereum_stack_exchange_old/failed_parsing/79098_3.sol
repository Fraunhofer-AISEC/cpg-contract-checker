event LogDeposit(address sender, uint amount);
event LogTransfer(address sender, address to, uint amount);

function deposit() public payable returns(bool success) {

    balances[msg.sender] += msg.value;
    emit LogDeposit(msg.sender, msg.value);
    return true;
}

function transfer(address payable to, uint value) public returns(bool success) 
{
    require( value <= balances[msg.sender],"Not enough balance") ;
    balances[msg.sender] -= value;
    to.transfer(value);
    emit LogTransfer(msg.sender, to, value);
    return true;
}

function getBalance() public view returns(uint) {
    return balances[msg.sender];
}
