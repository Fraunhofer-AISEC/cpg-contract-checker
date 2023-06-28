contract Balance{

    mapping(address => uint) public balances;
    uint public totalBalance;

    function credit() payable public{
        balances[msg.sender] += msg.value;
        totalBalance += msg.value;
    }

    function debit(uint amount) public{
        
        require(balances[msg.sender] >= amount);

        
        msg.sender.transfer(amount);
        balances[msg.sender] -= amount;
        totalBalance -= amount;
    }

}
