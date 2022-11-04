pragma solidity ^0.5.0;

contract Ballot {

    struct Voter {
        uint weight;
        bool voted;
        uint8 vote;
        
    }

    
    modifier onlyOwner () {
      require(msg.sender == chairperson);
      _;
    }

    
    address public chairperson;
    mapping(address => Voter) public voters;
    uint[4] public proposals;

    
    function Ballot() public {
        chairperson = msg.sender;
        voters[chairperson].weight = 2;
    }

    
    
    function register(address toVoter) public onlyOwner{
        if(voters[toVoter].weight != 0) revert();
        voters[toVoter].weight = 1;
        voters[toVoter].voted = false;
    }

    
    function vote(uint8 toProposal) public {
        Voter storage sender = voters[msg.sender];
        if (sender.voted || toProposal >= 4 || sender.weight == 0) revert();
        sender.voted = true;
        sender.vote = toProposal;
        proposals[toProposal] += sender.weight;
    }

    function winningProposal() public view returns (uint8 _winningProposal) {
        uint256 winningVoteCount = 0;
        for (uint8 prop = 0; prop < 4; prop++)
            if (proposals[prop] > winningVoteCount) {
                winningVoteCount = proposals[prop];
                _winningProposal = prop;
            }
    }

    function getCount() public view returns (uint[8]) {
        return proposals;
    }
}
