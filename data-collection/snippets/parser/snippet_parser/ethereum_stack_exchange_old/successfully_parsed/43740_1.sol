pragma solidity ^0.4.2;    

contract MyContract {

    uint startTime;
    function tmp() public view returns(uint){
        require(startTime != 0);
        return (now - startTime)/(1 minutes);
    }
    function callThisToStart() {
        startTime = now;
    }
    function callThisToStop() {
        startTime = 0;
    }
    function doSomething() returns (uint){
        return tmp();
    }

}
