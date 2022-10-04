pragma solidity ^0.5.0;

contract Sandbox {

  struct Leader {
    address host;
    uint fitness;
  }

  Leader[] public myList;

  function append(uint value) public {
    Leader memory leader = Leader(msg.sender, value);
    myList.push(leader);
  }

}
