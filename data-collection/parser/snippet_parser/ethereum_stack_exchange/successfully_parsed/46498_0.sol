pragma solidity ^0.4.22;


contract Tasks {

    struct Person { 
        uint weight; 
        bool deedCompleted;  
        address delegate; 
        uint deed;   
    }

    struct Proposal {
        bytes32 deedName;   
        uint karmaPoints;
    }

    address public chairperson;

    mapping(address => Person) public validators;

    Proposal[] public proposals;

    
    function Ballot(bytes32[] proposalNames) public {
        chairperson = msg.sender;
        validators[chairperson].weight = 1;

        
        
        
        for (uint i = 0; i < proposalNames.length; i++) {
            
            
            
            proposals.push(Proposal({
                deedName: proposalNames[i],
                karmaPoints: 0
            }));
        }
    }

    
    
    function giveRightToVote(address validator) public {
        require(
            msg.sender == chairperson,
            "Only chairperson can give right to deed."
        );
        require(
            !validators[validator].deedCompleted,
            "The validator already confirm deed was completed."
        );
        require(validators[validator].weight == 0);
        validators[validator].weight = 1;
    }

    
    function delegate(address to) public {
        Person storage sender = validators[msg.sender];
        require(!sender.deedCompleted, "You already completed a deed.");

        require(to != msg.sender, "Self-delegation is disallowed.");

        while (validators[to].delegate != address(0)) {
            to = validators[to].delegate;

            require(to != msg.sender, "Found loop in delegation.");
        }

        sender.deedCompleted = true;
        sender.delegate = to;
        Person storage delegate_ = validators[to];
        if (delegate_.deedCompleted) {
            
            
            proposals[delegate_.deed].karmaPoints += sender.weight;
        } else {
            
            
            delegate_.weight += sender.weight;
        }
    }

    
    function deed(uint proposal) public {
        Person storage sender = validators[msg.sender];
        require(!sender.deedCompleted, "Already deedCompleted.");
        sender.deedCompleted = true;
        sender.deed = proposal;

        
        
        
        proposals[proposal].karmaPoints += sender.weight;
    }

    
    
    function completedProposal() public view
            returns (uint completedProposal_)
    {
        uint completedVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].karmaPoints > completedVoteCount) {
                completedVoteCount = proposals[p].karmaPoints;
                completedProposal_ = p;
            }
        }
    }

    
    
    
    function winnerName() public view
            returns (bytes32 winnerName_)
    {
        winnerName_ = proposals[completedProposal()].deedName;
    }
}
