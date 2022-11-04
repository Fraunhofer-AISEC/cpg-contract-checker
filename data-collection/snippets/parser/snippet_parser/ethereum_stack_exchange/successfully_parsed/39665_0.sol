pragma solidity 0.4.18;

contract ValueSetter {
  struct BasicValue {
    uint256 value;
  }

  address my_address; 
  BasicValue fixed_value;
  mapping(address => BasicValue) fixed_values;

  function ValueSetter(address init_address) public {
    my_address = init_address;
    fixed_values[init_address] = fixed_value;
  }

  function set_value(uint256 my_value) external {
    
    require(msg.sender == my_address && my_value != 0);

    fixed_values[msg.sender].value = my_value;

    assert(fixed_value.value != 0);
  }
}
