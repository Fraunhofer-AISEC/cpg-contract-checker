address public creator;
address public owner;
uint256 public unlockDate;
uint256 public createdAt;

modifier onlyOwner {
    require(msg.sender == owner);
    _;
}

function TimeLockedWallet(
    address _creator,
    address _owner,
    uint256 _unlockDate
) public {
    creator = _creator;
    owner = _owner;
    unlockDate = _unlockDate;
    createdAt = now;
}


function() payable public { 
    Received(msg.sender, msg.value);
}


function withdraw() onlyOwner public {
   require(now >= unlockDate);
   
   msg.sender.transfer(this.balance);
   Withdrew(msg.sender, this.balance);
}


function withdrawTokens(address _tokenContract) onlyOwner public {
   require(now >= unlockDate);
   ERC20 token = ERC20(_tokenContract);
   
   uint256 tokenBalance = token.balanceOf(this);
   token.transfer(owner, tokenBalance);
   WithdrewTokens(_tokenContract, msg.sender, tokenBalance);
}

function info() public view returns(address, address, uint256, uint256, uint256) {
    return (creator, owner, unlockDate, createdAt, this.balance);
}

event Received(address from, uint256 amount);
event Withdrew(address to, uint256 amount);
event WithdrewTokens(address tokenContract, address to, uint256 amount);
