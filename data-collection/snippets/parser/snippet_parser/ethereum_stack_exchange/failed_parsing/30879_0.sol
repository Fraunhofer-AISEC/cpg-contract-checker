pragma solidity ^0.4.18;
contract addition {

    address creator;
    uint a;
    uint b;
    uint c;

    function addition() public 
    {
        creator = msg.sender;                                
        uint c = uint a + uint b; 
    }

    function addition() constant returns (uint) 
    {
        return uint c;
    }

    

    function kill()
    { 
        if (msg.sender == creator)
            suicide(creator);  
    }

}
