pragma solidity ^0.5.10;

contract A {
    constructor(uint x) public {
        p(x);
    }
    function p(uint x) internal {
        
    }
}
contract B is A {
    contructor(uint x) public {
        

        
        A.p(x);
        
        super.p(x);
    }
}
