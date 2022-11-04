

pragma solidity ^0.8.7;

contract Try{

    uint public deployedTime;

    constructor(){

        deployedTime = block.timestamp;

    }
    
    function getPassedTime() public view returns(uint256){
        return block.timestamp - deployedTime;

    }
    
}
