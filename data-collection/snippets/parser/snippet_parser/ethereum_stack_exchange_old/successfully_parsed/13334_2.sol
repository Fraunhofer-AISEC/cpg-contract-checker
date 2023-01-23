pragma solidity ^0.4.7;
contract MyContract {

  address public owner = msg.sender ;
  uint public creationTime = now;

  function getOwner() returns (address xowner) {
    return owner;
  }

}
