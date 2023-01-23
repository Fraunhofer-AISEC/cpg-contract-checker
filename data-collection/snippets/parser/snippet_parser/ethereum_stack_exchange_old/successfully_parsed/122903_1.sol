contract SimpleContract is Voting {

    IERC20 public token;

    constructor() {
        token = new NewsToken();
    }

    function balanceOf(address tokenOwner) public view returns (uint256) {
        return token.balanceOf(tokenOwner);
    }
}

