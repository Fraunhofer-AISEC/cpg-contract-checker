pragma solidity ^0.4.11;


contract Hackathon {

  address public leader;
  uint public leaderVotes;
  bool public isOver;
  uint public prize;
  address public owner;

  struct CandidateStruct {
    bytes32 name;
    uint votes;
    uint candidatePointer;
  }

  mapping(address => CandidateStruct) public candidateStructs;
  address[] public candidateList;

  modifier onlyOwner {
      if(msg.sender != owner) throw;
      _;
  }

  event LogDeposit(address sender, uint amount);
  event LogVote(address sender, address candidate, uint votes);
  event LogVotingClosed(address sender);
  event LogWinnerPaid(address sender, address winner, uint amount);
  event LogNewCandidate(address sender, bytes32 name, address candidate, uint row);
  event LogNewLeader(address leader);

  function Hackathon() {
      owner = msg.sender;
  }

  function deposit() payable returns(bool success) {
      LogDeposit(msg.sender, msg.value);
      prize = this.balance;
      return true;
  }

  function isCandidate(address candidate) public constant returns(bool success) {
      if(candidateList.length==0) return false;
      return(candidateList[candidateStructs[candidate].candidatePointer]==candidate);
  }

  
  
  function voteForCandidate(address candidate) public returns(bool success) {
    if(!isCandidate(candidate)) throw;
    if(isOver) throw;
    candidateStructs[candidate].votes += 1;
    if(candidateStructs[candidate].votes > leaderVotes) {
        leader = candidate;
        leaderVotes = candidateStructs[candidate].votes;
    }
    LogVote(msg.sender, candidate, candidateStructs[candidate].votes);
    return true;
  }

  function closeVoting() onlyOwner returns(bool success) {
    if(isOver) throw;
    isOver = true;
    LogVotingClosed(msg.sender);
    return true;
  }

  function payWinner() onlyOwner returns (bool) {
    if(!isOver) throw;
    if(prize == 0) throw;
    uint amount = prize;
    prize = 0; 
    LogWinnerPaid(msg.sender, leader, amount);
    leader.transfer(amount);
    return true;
  }

  function addCandidate(bytes32 name, address candidate) public returns(bool success) {
    if(isCandidate(candidate)) throw;
    candidateStructs[candidate].name = name;
    candidateStructs[candidate].candidatePointer = candidateList.push(candidate)-1;
    LogNewCandidate(msg.sender, name, candidate, candidateStructs[candidate].candidatePointer);
    return true;
  }

  function getCandidateCount() public constant returns (uint256) {
    return candidateList.length;
  }

  function kill() onlyOwner {
      selfdestruct(owner);
  }

}
