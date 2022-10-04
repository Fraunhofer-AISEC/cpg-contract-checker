pragma solidity ^0.4.18;

contract Voting {
    address mainAddress;
    bytes32[] candidateNames;
    mapping(bytes32 => uint) candidateVotes;
    mapping(bytes32 => bytes32) candidatesDetails;
    address[] voters;

    function Voting() public {
        mainAddress = msg.sender;
    }

    modifier isMainAddress {
        if (msg.sender == mainAddress) {
            _;
        }
    }

    function getAllCandidates() public view returns (bytes32[]) {
        return candidateNames;
    }

    function setCandidate(bytes32 newCandidate) isMainAddress public {
        candidateNames.push(newCandidate);
    }

    function setVote(bytes32 candidate) public {
        require(validVoters());
        candidateVotes[candidate] = candidateVotes[candidate] + 1;
        voters.push(msg.sender);
    }

    function getVote(bytes32 candidate) public view returns (uint) {
        return candidateVotes[candidate];
    }

    function setDescrption(bytes32 candidateName, bytes32 candidatesDesc) isMainAddress public {
        candidatesDetails[candidateName] = candidatesDesc;
    }

    function getDescription(bytes32 candidateName) public view returns (bytes32){
        return candidatesDetails[candidateName];
    }

    function getCurrentAddress() public view returns (address) {
        return msg.sender;
    }

    function validVoters() public view returns (bool) {
        for(uint i = 0; i < voters.length ; i++){
           if (voters[i] == msg.sender) {
                return false;
           } 
        }
        return true;
    }
}
