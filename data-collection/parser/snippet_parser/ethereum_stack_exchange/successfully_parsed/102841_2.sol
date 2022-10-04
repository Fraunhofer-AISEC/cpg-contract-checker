
pragma solidity ^0.7.0;

contract Store {
    uint value;

    function getValue() external view returns(uint){
        return value;
    }

    function setValue(uint _value) public {
        value = _value;
    }
}
