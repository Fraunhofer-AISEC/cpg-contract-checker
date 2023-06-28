pragma solidity ^0.4.23;

import "./RiskxToken.sol";

contract RiskxTokenSale {
    address admin;
    RiskxToken public tokenContract;

    function RiskxTokenSale(RiskxToken _tokenContract) public {
        admin = msg.sender;
        tokenContract = _tokenContract; 
        
        
    }
}
