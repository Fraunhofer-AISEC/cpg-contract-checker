    using SafeMath for uint256;
    constructor(ILendingPoolAddressesProvider _addressProvider)
        FlashLoanReceiverBase(_addressProvider)
    {}
    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    ) external override returns (bool) {
        for (uint256 i = 0; i < assets.length; i++) {
            uint256 amountOwing = amounts[i].add(premiums[i]);
            IERC20(assets[i]).approve(address(LENDING_POOL), amountOwing);
        }
        return true;
    }
    function myFlashLoanCall() public {
        address receiverAddress = address(this);
        address[] memory assets = new address[](7);
        uint256[] memory amounts = new uint256[](7); 
        uint256[] memory modes = new uint256[](7);
        address onBehalfOf = address(this);
        bytes memory params = "";
        uint16 referralCode = 0;

        LENDING_POOL.flashLoan(
            receiverAddress,
            assets,
            amounts,
            modes,
            onBehalfOf,
            params,
            referralCode
        );
    }
}
