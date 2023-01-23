pragma solidity ^0.8.0;

contract Contract1  {

  string public _str_1;
  uint256 public _val_1;

  constructor(string memory str_in1, uint256 in_val_1 ) {
    _str_1 = str_in1;
    _val_1 = in_val_1;
  } 

  function get_str() external view returns (string memory) {
    return _str_1;
  } 

  function set_str(string memory str_in1) external returns (string memory) {
    _str_1 = str_in1;
    return _str_1;
  } 

  function fun_sum256(uint256 in_val_2) public returns (uint256) {
    _val_1 += in_val_2;
    return _val_1;
  } 

} 
