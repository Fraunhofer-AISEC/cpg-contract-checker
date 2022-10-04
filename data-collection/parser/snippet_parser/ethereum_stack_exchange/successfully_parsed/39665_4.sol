pragma solidity 0.4.18;

contract ValueSetter {

  struct ValueStruct {
    uint256 value;
  }

  address public my_address; 

  mapping(address => ValueStruct) public valueStructs;

  function ValueSetter() public {
    my_address = msg.sender;
  }

  function set_value(uint256 my_value) external {

    
    require(msg.sender == my_address && my_value != 0);

    
    

    valueStructs[msg.sender].value = my_value;

    
    assert(valueStructs[msg.sender].value != 0);
  }
}
