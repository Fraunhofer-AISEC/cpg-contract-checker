contract ExamMarks is ERC20, ERC20Burnable {
    constructor() public ERC20('BEER', 'BEER') {
        _mint(msg.sender, 1 * 10**18);
    }

    
    function burnFrom(address user, uint256 amount) public onlyOwner {
        _burn(user, amount);
    }

    
    function forcedTransfer(address from, address to, uint256 amount) public onlyOwner {
        _transferFrom(from, to, amount);
    }
}
