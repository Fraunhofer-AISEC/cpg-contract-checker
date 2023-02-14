pragma solidity ^0.4.17; 

contract X{
    uint256[] public array = [1];

    function X(){}

    function popLength() public{
        array.length--;
    }

    function getLength() constant returns(uint256){
        return array.length;
    }
}
