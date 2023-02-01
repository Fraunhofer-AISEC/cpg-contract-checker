contract Test {

    IERC20 token;

    constructor(address tokenAddress){
        token = IERC20(tokenAddress)
    }

    function payWithToken() external {
        require(token.balanceOf(msg.sender) > 5000, "insufficient token amount")
        token.transferFrom(msg.sender, address(this), 5000;
        ...
    }
}
