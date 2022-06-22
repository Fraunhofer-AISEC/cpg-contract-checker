contract Flasher is FlashLoanSimpleReceiverBase, Withdrawable {
constructor(IPoolAddressesProvider _providerAddress)
    FlashLoanSimpleReceiverBase(_providerAddress)
{}

function flashLoanSimple(address asset, uint256 amount) external {
    require(asset != address(0), "Address zero no");
    require(amount > 0, "Pone plata");
    address receiverAddress = address(this);
    uint256 _amount = amount * 10**18;
    bytes memory params = "";
    uint16 referralCode = 0;

    POOL.flashLoanSimple(
        receiverAddress,
        asset,
        _amount,
        params,
        referralCode
    );
}

function executeOperation(
    address asset,
    uint256 amount,
    uint256 premium,
    address initiator,
    bytes calldata params
) external override returns (bool) {
    

    
    uint256 fee = LowGasSafeMath.add(amount, premium);
    IERC20(asset).approve(address(POOL), fee);
    return true;
}
}