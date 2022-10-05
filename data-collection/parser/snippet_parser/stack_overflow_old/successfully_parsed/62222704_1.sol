constructor(address _wallet, uint256 _rate, address _tokenAddress) public {
    wallet = _wallet;
    rate = _rate;
    token = ERC20(_tokenAddress);
    owner = msg.sender;
}
