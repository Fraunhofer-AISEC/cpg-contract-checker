pragma solidity ^0.4.19;


contract InnerContract {
    uint public value;
    function setValue(uint new_value) {
        value = new_value;
    }
}

contract Contract {
    mapping(address => InnerContract) public contracts;

    function makeNew() {
        contracts[msg.sender] = new InnerContract();
    }
    function initialize() {
      contracts[msg.sender].setValue(3);
    }
    function get() constant returns (uint) {
      return contracts[msg.sender].value();
    }
}
