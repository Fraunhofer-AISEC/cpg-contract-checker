pragma solidity ^0.4.24;
contract A {
    uint t;

    function run() public returns(uint){
        uint startTime = 9;
        uint allowedTime = 7;

        uint v = startTime + allowedTime; 
        t = now + v;
        return t;
    }
}
