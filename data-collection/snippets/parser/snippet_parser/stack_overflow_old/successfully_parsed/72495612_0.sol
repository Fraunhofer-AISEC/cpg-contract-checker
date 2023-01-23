function Deposit(uint _amount) payable public{
    require(msg.value == _amount);
    funds[msg.sender] += _amount;
}
