pragma solidity ^0.4.20;

import "./SafeMath.sol";

contract Percentage{

    uint public testvalue;

    
    constructor(uint256 _value, uint256 percentage) public {

        
       uint transferAmount = (_value * SafeMath.sub(100, percentage)) / 100;

       
       testvalue = transferAmount;
    }   
}
