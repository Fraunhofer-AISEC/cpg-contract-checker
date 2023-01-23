pragma solidity ^0.5.0;

import "zos-lib/contracts/Initializable.sol";

contract Verifications is Initializable { 

  mapping (bytes32 => bytes32) public data;
  address public owner;

  function initialize(bytes32[] _data) initializer public {
    owner = msg.sender;
    data = _data;
  }
}
