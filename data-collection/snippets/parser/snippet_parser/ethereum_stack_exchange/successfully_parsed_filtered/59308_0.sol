pragma solidity ^0.4.17;

contract ICO {
    string message; 

    function enterIco() payable public {
        if(msg.value == 0.00000001 ether)
        {
            return message; 
        }
    } 

}
