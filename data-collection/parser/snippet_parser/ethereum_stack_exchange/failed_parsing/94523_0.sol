interface TokenInterface {
    function balanceOf(address account) view external;
}

contract Contract {
    address public tokenAddress = 0xc5d63121bA479BAeb666a896e84283a1a0AefAe6;

    TokenInterface token = TokenInterface(tokenAddress);

    function stake(uint256 amount) public {
        require(token.balanceOf(msg.sender) >= amount, "Insufficient balance.");

        ...

    }
}
