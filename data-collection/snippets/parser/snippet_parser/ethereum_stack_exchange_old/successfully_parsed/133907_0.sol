function mint(address to, uint256 amount) public payable{
    _mint(to, amount);
}

receive() external payable{}
