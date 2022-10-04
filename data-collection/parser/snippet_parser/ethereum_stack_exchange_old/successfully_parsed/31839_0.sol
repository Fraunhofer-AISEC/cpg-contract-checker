pragma solidity ^0.4.11;


contract Ballot {



struct Voter {
    uint weight; 
    bool voted;  
    address delegate; 
    uint vote;   
}


struct Proposal {
    bytes32 name;   
    uint voteCount; 
}

address public chairperson;



mapping(address => Voter) public voters;


Proposal[] public proposals;


function Ballot(bytes32[] proposalNames) internal {
    chairperson = msg.sender;
    voters[chairperson].weight = 1;

    
    
    
    for (uint i = 0; i < proposalNames.length; i++) {
        
        
        
        proposals.push(Proposal({
            name: proposalNames[i],
            voteCount: 0
        }));
    }
}

function getProposalsCount() public constant returns(uint) {
    return proposals.length;
}

function getProposal(uint index) public constant returns(bytes32, uint) {
    return (proposals[index].name, proposals[index].voteCount);
}



function giveRightToVote(address voter) public {
    
    
    
    
    
    
    
    require((msg.sender == chairperson) && !voters[voter].voted && (voters[voter].weight == 0));
    voters[voter].weight = 1;
}


function delegate(address to) public {
    
    Voter storage sender = voters[msg.sender];
    require(!sender.voted);

    
    require(to != msg.sender);

    
    
    
    
    
    
    
    
    while (voters[to].delegate != address(0)) {
        to = voters[to].delegate;

        
        require(to != msg.sender);
    }

    
    
    sender.voted = true;
    sender.delegate = to;
    Voter storage delegate2 = voters[to];
    if (delegate2.voted) {
        
        
        proposals[delegate2.vote].voteCount += sender.weight;
    } else {
        
        
        delegate2.weight += sender.weight;
    }
}



function vote(uint proposal) public {
    Voter storage sender = voters[msg.sender];
    require(!sender.voted);
    sender.voted = true;
    sender.vote = proposal;

    
    
    
    proposals[proposal].voteCount += sender.weight;
}



function winningProposal() public constant
        returns (uint winningProposal2)
{
    uint winningVoteCount = 0;
    for (uint p = 0; p < proposals.length; p++) {
        if (proposals[p].voteCount > winningVoteCount) {
            winningVoteCount = proposals[p].voteCount;
            winningProposal2 = p;
        }
    }
}




function winnerName() public constant
        returns (bytes32 winnerName2)
{
    winnerName2 = proposals[winningProposal()].name;
}
}
