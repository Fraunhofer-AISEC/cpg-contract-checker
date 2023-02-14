contract Bounty {
    address payable public owner;
    address payable public provider;
    uint256 private bounty;
    bool isActive;
    event IncreaseBounty (uint256 oldBounty, uint256 newBounty);
    event Paid(address owner, address payee, uint256 amount);
    event Cancel(address owner, uint256 amount);

    constructor() payable {
        owner = payable(msg.sender);
        bounty = msg.value;
        isActive = true;
    }

    function cancel() public {
        require(isActive, "contract must be active");
        require(owner == msg.sender, "Only the owner can cancel the bounty");
        uint256 bountyTemp = bounty;
        bounty = 0;
        owner.transfer(bountyTemp);
        isActive = false;
        emit Cancel(msg.sender, bountyTemp);
    }

    function setAndTransferToProvider(address addy) public {
        require(isActive, "contract must be active");
        require(owner == msg.sender, "Only the owner release the funds");
        provider = payable(addy);
        provider.transfer(bounty);
        uint256 bountyUsed = bounty;
        bounty = 0;
        isActive = false;
        emit Paid(owner, provider, bountyUsed);
    }

    function increaseBounty() payable external returns (uint256) {
        require(isActive, "contract must be active");
        require(owner == msg.sender, "Only the owner can increase the bounty");
        uint oldBounty = bounty;
        bounty += uint(msg.value);
        emit IncreaseBounty(oldBounty, bounty);
        return bounty;
    }
    
    function getBounty() public view returns (uint256) {
        require(isActive, "contract must be active");
        return bounty;
    }
}
