contract Registry {
    address owner;

    function isVoter(address _addr) external returns(bool) {
        
    }
}

contract Election {
    Registry registry;

    modifier isEligible(address _addr) {
        require(registry.isVoter(_addr));
        _;
    }

    function vote() isEligible(msg.sender) public {
        
    }
}
