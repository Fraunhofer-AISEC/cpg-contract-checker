contract VulnerableContract {
    mapping(address => uint) public balances;
     
    function deposit() public payable {
        require(msg.value > 1);
        balances[msg.sender] += msg.value;
    }
     
    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Not enough balance!");
        msg.sender.call.value(_amount)("");
        balances[msg.sender] -= _amount;
    }
     
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }
     
    fallback() payable external {}
}