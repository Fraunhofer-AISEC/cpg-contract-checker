pragma solidity ^0.4.22;

contract aPlusb{
    function aPlusb(){}
    uint a=1;
    event happen(uint input,uint output);
    function plus(uint a,uint b) returns (uint){
        require(a==2);
        happen(a,a+1);
        return a+1;
    }
}
