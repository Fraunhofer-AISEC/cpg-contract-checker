pragma solidity ^0.4.16; 


contract Incrementor { 

    uint x; 


    constructor() public { 
       
       x = 10; 
    } 


    function getX() external view returns (uint xValue) { 
        return (x); 
    } 


    function incrementX(uint byThisMuch) public { 
        x += byThisMuch; 
    } 


}
