struct Voter {
        bool isRegistered;
        bool hasVoted;
        uint votedProposalId;
    }

mapping (address => Voter) public voters;

modifier onlyVoters() {
        require(voters[msg.sender].isRegistered, "You're not a voter");
        _;
    }

    function getVoter(address _addr) external onlyVoters view returns (Voter memory) {
        return voters[_addr];
    }

    function addVoter(address _addr) external onlyOwner {

        voters[_addr].isRegistered = true;
    }

