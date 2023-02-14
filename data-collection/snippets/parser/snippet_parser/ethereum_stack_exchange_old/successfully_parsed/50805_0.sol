pragma solidity ^0.4.0;
contract Ballot {

event isEOAOrNot(bool val);

function isContract(address addr) returns (bool) {
  uint size;

  assembly { size := extcodesize(addr) }
  bool val = size > 0;
  isEOAOrNot(val);
  return val;
}




}
