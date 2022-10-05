pragma solidity ^0.4.18;

contract TimeLockedWallet {
    address public owner;
    uint256 public unlockDate;
    uint256 public createdAt;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function TimeLockedWallet(address _owner, uint256 _unlockDate) public {
        owner = _owner;
        unlockDate = _unlockDate;
        createdAt = now;
    }

    
    function() public payable {
        Received(msg.sender, msg.value);
    }

    
    function withdraw() public onlyOwner {
        require(now >= unlockDate);
        
        msg.sender.transfer(this.balance);
        Withdrew(msg.sender, this.balance);
    }

    function info()
        public
        view
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        return (unlockDate, createdAt, this.balance);
    }

    event Received(address from, uint256 amount);
    event Withdrew(address to, uint256 amount);
    event WithdrewTokens(address tokenContract, address to, uint256 amount);
}
