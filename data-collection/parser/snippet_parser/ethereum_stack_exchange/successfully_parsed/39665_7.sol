  function set_value(uint256 my_value) external {
    
    require(msg.sender == my_address && my_value != 0);

    fixed_values[msg.sender].value = my_value;

    assert(fixed_value.value != 0);
  }
