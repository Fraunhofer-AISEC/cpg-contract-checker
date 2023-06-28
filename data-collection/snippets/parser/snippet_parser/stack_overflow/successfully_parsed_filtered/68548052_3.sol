pragma solidity ^0.6.4;


import { ICount } from  './ICount.sol';
import { Count } from  './Count.sol';

contract Math {
    
    using Count for ICount;
    
    address h;
    
    constructor() public {
        ICount(h).setA(123);
        ICount(h).setGood(1, true);
    }
    
    function subHold(uint a) public view  returns(uint){
        return ICount(h).subUint(a);
    }
    
    function show(uint a) public view returns ( bool){
        return ICount(h).showGood(a);
    }
}
