    function deposit() public payable {   
        require (msg.value == 1 ether);   
        emit Deposit(msg.sender,msg.value);
 }
