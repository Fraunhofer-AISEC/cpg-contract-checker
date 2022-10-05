pragma solidity ^0.4.0;

library IntExtended{

    function increment(uint _self) returns (uint){
        return _self+1;
    }
}


contract TestLibrary{
    using IntExtended for uint;

    function testIncrement(uint _base) returns (uint){
        return _base.increment();
    }
}

0x1 Transaction mined and execution succeed
 decoded input  {
    "uint256 _base": "5"
}
 decoded output     {
    "0": "uint256: 6"
}
