pragma solidity ^0.4.18;


contract Voting {
  

  mapping (bytes32 => uint8) public votesReceived;

  

  bytes32[] public candidateList;


  
  function Voting(string[] candidateNames) public {
        for(uint i = 0; i < candidateNames.length; i++) {
            candidateList[i]= stringToBytes32(candidateNames[i]);

        }

 }
  function totalVotesFor(bytes32 candidate) view public returns (uint8) {

    return votesReceived[candidate];
  }

  function stringToBytes32(string memory source) returns (bytes32 result) {
    bytes memory tempEmptyStringTest = bytes(source);
    if (tempEmptyStringTest.length == 0) {
        return 0x0;
    }

    assembly {
        result := mload(add(source, 32))
    }
}


  function voteForCandidate(bytes32 candidate) public {

    votesReceived[candidate] += 1;
  }


}
