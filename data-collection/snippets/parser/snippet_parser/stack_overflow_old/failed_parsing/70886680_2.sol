interface IToken {
    function commissionTransfer(address, address, uint256) external returns (bool);
}

contract tokenCommission {
    address tokenAddress=0xetc;

    function transfer(address recipient, uint256 amount) public returns (bool) {
        return IToken(tokenAddress).commissionTransfer(msg.sender, recipient, amount);
    }

    function decimals() public view virtual returns (uint8) {
        return 18;
    }
}
