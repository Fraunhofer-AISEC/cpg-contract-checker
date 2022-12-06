mapping (address => uint256) public accountBalance;

function deposit(uint256 amount) public {
    accountBalance[msg.sender] = accountBalance[msg.sender].add(amount);
    require(daiToken.transferFrom(msg.sender, address(this), amount));
}
