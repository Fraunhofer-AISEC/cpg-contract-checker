contract MyEscrow {

    mapping(address => mapping(address => uint256)) public _deposits;
    address payable payee = payable(msg.sender);
    address tokenaddress = 0x...;
    MyToken token = MyToken(tokenaddress);

    function deposit(uint256 amount) public payable {
        token.approve(msg.sender, address(this), amount);
        token.transferFrom(msg.sender, address(this), amount);
        _deposits[payee][tokenaddress] += amount;
    }

    function depositsOf() public view returns (uint256) {
        return _deposits[payee][tokenaddress];
    }

    function withdraw(uint256 payment) public payable {
        _deposits[payee][tokenaddress] -= payment;
        token.transfer(msg.sender, payment);
    }
}
