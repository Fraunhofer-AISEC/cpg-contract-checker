  mapping (address => uint256) public balances;

    event LogDeposit(address sender, uint amount);
    event LogTransfer(address sender, address to, uint amount);

    function deposit() payable returns(bool success) {

        balances[msg.sender] += msg.value;
        LogDeposit(msg.sender, msg.value);
        return true;
    }

    function transfer(address to, uint value) payable public returns(bool success) 
    {
        if(balances[msg.sender] < value) throw;
        balances[msg.sender] -= value;
        to.transfer(value);
        LogTransfer(msg.sender, to, value);
        return true;
    }
