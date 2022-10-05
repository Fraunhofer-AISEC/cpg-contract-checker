mapping (address => uint256) public accountBalance;

function deposit(uint256 amount) public {
    require(daiToken.transferFrom(msg.sender, address(this), amount));
    accountBalance[msg.sender] = accountBalance[msg.sender].add(amount);
}
