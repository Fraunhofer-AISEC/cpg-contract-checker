pragma solidity ^0.4.11;


contract Hackathon {

  struct Entry {
    bytes32 name;
    uint votes;
    address wallet;
  }

  Entry[] public entries;
  address winner;

  function AddEth () payable {}

  

  mapping (bytes32 => uint8) public votesReceived;

  

  
  function Hackathon() {
  }

  
  function totalVotesFor(bytes32 candidate) returns (uint8) {
    if (validCandidate(candidate) == false) throw;
    return votesReceived[candidate];
  }

  
  
  function voteForCandidate(bytes32 candidate) {
    if (validCandidate(candidate) == false) throw;
    votesReceived[candidate] += 1;
  }

  function validCandidate(bytes32 candidate) returns (bool) {
    for(uint i = 0; i < entries.length; i++) {
      if (entries[i].name == candidate) {
        return true;
      }
    }
    return false;
  }

  function getWinner() returns (bytes32, uint256, address) {

    bytes32 winnerName;
    uint winningVoteCount = 0;

    for (uint p = 0; p < entries.length; p++) {
        if (votesReceived[entries[p].name] > winningVoteCount) {
            winningVoteCount = votesReceived[entries[p].name];
            winnerName = entries[p].name;
            winner = entries[p].wallet;
        }
    }

    return (winnerName, winningVoteCount, winner);
  }

  function payWinner() returns (bool) {

    winner.transfer(23);

    return true;
  }

  function addEntry(bytes32 name, address wallet) returns (uint256) {

    Entry memory tmpEntry;
    tmpEntry.name = name;
    tmpEntry.wallet = wallet;

    return entries.push(tmpEntry);
  }

  function getEntriesCount() returns (uint256) {

    return entries.length;
  }

  function getEntry(uint index) returns (bytes32, uint, address) {

    return (entries[index].name, votesReceived[entries[index].name], entries[index].wallet);
  }
}
