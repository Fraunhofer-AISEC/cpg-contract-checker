function validateAndPayForPaymasterTransaction(
    bytes32, 
    bytes32, 
    Transaction calldata _transaction
) external payable override onlyBootloader returns (bytes4 magic, bytes memory context) {
    require(
        _transaction.paymasterInput.length >= 4,
        "The standard paymaster input must be at least 4 bytes long"
    );

    bytes4 paymasterInputSelector = bytes4(
        _transaction.paymasterInput[0:4]
    );
    if (paymasterInputSelector == IPaymasterFlow.approvalBased.selector) {
        (address token, uint256 minAllowance, ) = abi
            .decode(
                _transaction.paymasterInput[4:],
                (address, uint256, bytes)
            );

        require(token == allowedToken, "Invalid token");
        require(minAllowance >= 1, "Min allowance too low");

        address userAddress = address(uint160(_transaction.from));
        address thisAddress = address(this);

        uint256 providedAllowance = IERC20(token).allowance(
            userAddress,
            thisAddress
        );
        require(
            providedAllowance >= PRICE_FOR_PAYING_FEES,
            "The user did not provide enough allowance"
        );

        
        
        uint256 requiredETH = _transaction.gasLimit *
            _transaction.maxFeePerGas;

        
        IERC20(token).transferFrom(userAddress, thisAddress, 1);
        
        (bool success, ) = payable(BOOTLOADER_FORMAL_ADDRESS).call{
            value: requiredETH
        }("");
        require(success, "Failed to transfer funds to the bootloader");
    } else {
        revert("Unsupported paymaster flow");
    }
}
