IERC20 private _token;
constructor(address token, uint256 duration) {
        owner = msg.sender;
        deployedAt = block.timestamp;
        _token = IERC20(token);
    }
