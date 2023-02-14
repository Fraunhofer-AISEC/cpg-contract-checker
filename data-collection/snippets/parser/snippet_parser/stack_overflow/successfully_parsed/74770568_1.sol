interface Token {
    function mint(address to, uint256 amount) external;
}

function testMint(address _address) external onlyOwner {
        Token caller = Token(_betTokenAddress);
        caller.mint(_address, 1000000);
    }
