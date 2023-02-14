pragma solidity ^0.5.10;

contract A {
    constructor(uint x) public {
        
    }
}
contract B is A {
    contructor(uint x) public {
        

        
        A(x);
        
        super.constructor(x); 
        
    }
}
