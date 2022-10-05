pragma solidity^0.4.25;

contract SimpleMultisig {

  address one;
  address two;

  mapping(address => bool) signed;

  constructor() public {
    one = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c;
    two = 0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db;
  }

  function Sign() public {
    require (msg.sender == one || msg.sender == two);
    require (!signed[msg.sender]);
    signed[msg.sender] = true;
  }

  function Action() public returns (string) {
    require (signed[one] && signed[two]);
    return "Your action here";
  }
}
