pragma solidity >= 0.4.0 <0.6.0;

contract Voting{
    enum StateType{
      Creation,
      Voting,
      BallotFinish
    }
    StateType public State;
    mapping(bytes32 => uint256) public votesCount;
    address public admin;
    bytes32[] public candidatesList;
    bytes32[] public voterList;
    constructor(bytes32[] memory candidateNames,bytes32[] memory voterNames) public{
        State = StateType.Creation;
        admin = msg.sender;
        candidatesList = candidateNames;
        voterList = voterNames;
    }
    function totalVotesFor(bytes32 candidate) public view returns (uint256)
    {
        require(validCandidate(candidate));
        return votesCount[candidate];
    }
    function voteForCandidate(bytes32 voter,bytes32 candidate) public {
        if(admin == msg.sender)
        {
            revert();
        }
        if(State == StateType.Voting)
        {
            require(validVoter(voter));
            require(validCandidate(candidate));
            votesCount[candidate] += 1;
        }
        else
        {
            revert();
        }
    }
    function validVoter(bytes32 voter) public view returns (bool) {
        for(uint i=0;i<voterList.length;i++)
        {
            if(voterList[i]==voter)
                return true;
        }
        return false;
    }
    function validCandidate(bytes32 candidate) public view returns (bool) {
        for(uint i=0 ; i < candidatesList.length ; i++)
        {
            if(candidatesList[i]==candidate)
                return true;
        }
        return false;
    }
}
