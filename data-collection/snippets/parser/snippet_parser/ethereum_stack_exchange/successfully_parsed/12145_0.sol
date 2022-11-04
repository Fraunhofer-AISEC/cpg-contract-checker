pragma solidity ^0.4.8;

contract Vote {

  uint public totalVotes;

  mapping (address => uint) public voterCount;

  function vote(uint votes) returns(bool success) {
    totalVotes += votes;
    voterCount[msg.sender] += votes; 
    return true;
  }
}
