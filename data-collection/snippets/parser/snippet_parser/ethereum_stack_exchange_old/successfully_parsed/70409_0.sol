pragma solidity ^0.4.17; 

contract ArrayOverflow{
    uint256 public target = 10;
    uint256[] public array = [9,8];

    function modifyArray (uint256 _index, uint256 _value){
        array[_index] = _value;
    }

    function popLength() public{
        
        array.length--;
    }

    function getLength() constant returns(uint256){
        return array.length;
    }

}
