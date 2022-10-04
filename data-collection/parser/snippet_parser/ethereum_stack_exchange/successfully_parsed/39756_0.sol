pragma solidity ^0.4.18;

contract Voting{

    mapping(bytes32 => uint8) public votesRecived;
    bytes32[] public candidateList;

    function Voting( bytes32[] candidateNames) public{
        candidateList = candidateNames;
    }

    function totalVotesFor(bytes32 candidate) public view returns(uint8){
        require(validCandidate(candidate));
        return votesRecived[candidate];
    }

    function voteForCandiadte(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesRecived[candidate] += 1;

    }

    function validCandidate(bytes32 candidate) view public returns(bool){
        for(uint i = 0; i<candidateList.length; i++){
            if (candidateList[i] == candidate)
            {
                return true;
            }

        }
        return false;    
    }
    function candidateNamesFun() view public returns(bytes32[]){
        return candidateList;
    }

}
