    pragma solidity ^0.8.0;
    contract PiggyBank{
    address creator;
    uint deposits;

    function PiggyBank public()          \\error in this line
    {
        creator=msg.sendor;
        deposits=0;
    }

    function deposit() payable returns(uint)
    {
        if(msg.value>0)
        deposits=deposits+1;
        return getNumberofDeposits();  
    }

    function getNumberofDeposits() constant returns(uint)
    {
        return deposit;
    }
    
    function Killl();{
    if(msg.sendor==creator)
    selfdestruct(creator);
    }
}
