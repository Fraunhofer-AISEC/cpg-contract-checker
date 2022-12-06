pragma solidity ^0.4.18;

contract KVStore {

 mapping(address => mapping(string => string)) store;
 uint MAX_STR_LENGTH = 1000;

 function get(address _acct, string _key) public view returns(string) {
    return store[_acct][_key];
 }
 function set(string _key, string _value) public {
   if (bytes(_value).length <= MAX_STR_LENGTH) {
     store[msg.sender][_key] = _value;
   }
 }

}
