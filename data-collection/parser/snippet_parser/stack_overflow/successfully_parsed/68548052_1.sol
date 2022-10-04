pragma solidity ^0.6.4;


import { Count } from  './Count.sol';

contract Math {
    
    using Count for Count.hold;
    
    Count.hold  h;
    address h1;
    
    constructor() public {
        h.a = 123;
        h.isGood[1] = true;
    }
    
    function subHold(uint a) public view  returns(uint){
        return h.subUint(a);
    }
    
    function show(uint a) public view returns ( bool){
        return h.isGood[a];
    }
}
