contract lpToken is ERC20, Ownable {
    constructor(string memory name, string memory ticker) ERC20(name, ticker) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
    function getBalance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }
}
