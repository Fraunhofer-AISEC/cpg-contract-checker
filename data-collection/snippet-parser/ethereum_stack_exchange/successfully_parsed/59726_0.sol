pragma solidity ^0.4.2;


 import './AjToken.sol';

contract AjTokenSale {
    address admin;
    AjToken public tokenContract;
    function AjTokenSale() public {
        
        admin = msg.sender;
        
        

    }   
}
