
event Deposited(uint value); 

    function deposit() public payable{
        balances[msg.sender] += msg.value; 
        emit Deposited(msg.value);
    }
