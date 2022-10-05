contract Ballot {
    address public manager;
    mapping (address => bool) public contributors;

    Proposal[] proposals;
    mapping(address => Proposal[]) proposalsByAddress;

    constructor(address _creator) public {
        manager = _creator;
    }

    function createProposal() public {
        Proposal memory newProposal = new Proposal();
        proposalsByAddress[msg.sender].push(newProposal);

        
        proposals.push(newProposal);
    }

    function checkIfContributor(uint address _address) public view returns (bool) {
        require(proposalsByAddress[msg.sender]);

        if (contributors[_address]) {
            return true;
        } else {
            return false;
        }
    }
}
