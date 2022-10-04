pragma solidity ^0.4.16;

contract exampleContract {
    uint256 private value;
    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function exampleContract(uint256 _value) public {
        owner = msg.sender;
        value = _value;
    }

    function viewValue() onlyOwner public returns(uint256) {
        return(value);
    }
}
