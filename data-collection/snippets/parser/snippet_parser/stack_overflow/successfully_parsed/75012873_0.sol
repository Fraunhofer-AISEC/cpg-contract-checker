struct SwapResolverOptions {
    bytes path;
    uint256 deadline;
    uint256 amountIn;
    uint256 amountOutMinimum;
    address inputTokenAddress;
    address targetAddress;
    address destinationAddress; 
}

function validateAdditionalCalldata(bytes calldata resolverOptions) pure override external {
    abi.decode(resolverOptions, (SwapResolverOptions)); 
}
