    pragma solidity ^0.4.6;






contract ForcedForward {

    struct DepositStruct {
        address sender;
        uint amount;
        uint blockNumber;
        uint deadline;
    }

    mapping(address => DepositStruct[]) spenderDepositStructs;

    event LogReceived (address spender, uint depositNumber, uint amount, uint deadline, address sender);
    event LogForwarded(address spender, uint depositNumber, uint amount, address recipient);
    event LogWithdrawn(address spender, uint depositNumber, uint amount, address sender);

    
    
    
    

    function deposit(address spender, uint deadline)
        public
        payable
        returns(bool success)
    {
        if(deadline <= block.number) throw; 
        if(msg.value==0) throw; 
        DepositStruct memory d;
        d.sender = msg.sender;
        d.amount = msg.value;
        d.deadline = deadline;
        spenderDepositStructs[spender].push(d);
        LogReceived(spender, spenderDepositStructs[spender].length-1, msg.value, deadline, msg.sender);
        return true;
    }

    
    
    

    function forward(address recipient, uint depositNumber)
        public
        returns(bool success)
    {
        DepositStruct d = spenderDepositStructs[msg.sender][depositNumber];
        if(d.deadline < block.number) throw; 
        uint amount = d.amount;
        if(amount == 0) throw; 
        spenderDepositStructs[msg.sender][depositNumber].amount = 0; 
        if(!recipient.send(d.amount)) throw;
        LogForwarded(msg.sender, depositNumber, amount, recipient);
        return true;
    }

    
    

    function withdraw(address spender, uint depositNumber)
        public
        returns(bool success)
    {
        DepositStruct d = spenderDepositStructs[spender][depositNumber];
        if(d.sender != msg.sender) throw; 
        if(d.deadline > block.number) throw; 
        uint amount = d.amount;
        spenderDepositStructs[spender][depositNumber].amount = 0; 
        if(amount==0) throw; 
        if(!msg.sender.send(amount)) throw; 
        LogWithdrawn(spender, depositNumber, amount, msg.sender);
        return true;
    }

    
    

    function getSpenderDepositCount(address spender) 
        public
        constant
        returns(uint spenderDepositCount)
    {
        return spenderDepositStructs[spender].length;
    }

    function getSpenderDeposit(address spender, uint depositNumber)
        public
        constant
        returns(address sender, uint amount, uint deadline)
    {
        DepositStruct d;
        d = spenderDepositStructs[spender][depositNumber];
        return(d.sender, d.amount, d.deadline);
    }

}
