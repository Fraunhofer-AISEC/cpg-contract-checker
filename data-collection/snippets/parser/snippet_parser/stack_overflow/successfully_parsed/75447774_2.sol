constructor(
    address _token,
    address payable _usdtWallet,
    address _vestingContract
) {
    require(
        address(_token) != address(0),
        "ERROR at Crowdsale constructor: Token contract address shouldn't be zero address."
    );
    require(
        _usdtWallet != address(0),
        "ERROR at Crowdsale constructor: USDT wallet address shouldn't be zero address."
    );
    require(
        _vestingContract != address(0),
        "ERROR at Crowdsale constructor: Vesting contract address shouldn't be zero address."
    );

    token = ERC20(_token);
    usdtWallet = _usdtWallet;
    totalAllocation = 0;
    vestingContract = IVesting(_vestingContract);
    transferOwnership(msg.sender);
}
