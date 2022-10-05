pragma solidity ^0.4.11;
contract sample {
 string public name = "NAME";
function set(string _name) {
   name = _name;
}
function get() constant returns (string) {
  return name;
}
}
