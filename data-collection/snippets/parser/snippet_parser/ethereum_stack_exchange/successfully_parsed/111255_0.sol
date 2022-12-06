IERC20 public daiInstance;
uint256 public totalSupply;
mapping(address => uint256) public balances;

constructor(IERC20 _daiInstance) public {
    daiInstance = _daiInstance;
}

function buyXXX(uint256 daiAmount) external {
    uint256 xxxAmount = toXXX(daiAmount);
    bool success = daiInstance.transferFrom(msg.sender, address(this), daiAmount);
    require(success, "buy failed");
    totalSupply = totalSupply.add(xxxAmount);
    balances[msg.sender] = balances[msg.sender].add(xxxAmount);
}

function sellXXX(uint256 xxxAmount) external {
    uint256 daiAmount = toDAI(xxxAmount);
    totalSupply = totalSupply.sub(xxxAmount);
    balances[msg.sender] = balances[msg.sender].sub(xxxAmount);
    bool success = daiInstance.transfer(msg.sender, daiAmount);
    require(success, "sell failed");
}

function toXXX(uint256 daiAmount) internal view returns (uint256) {
    
}

function toDAI(uint256 xxxAmount) internal view returns (uint256) {
    
}
