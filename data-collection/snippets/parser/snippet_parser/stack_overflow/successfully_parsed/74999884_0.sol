function validateAdditionalCalldata(bytes calldata resolverOptions) external view;
function resolve(uint256 amountIn, bytes calldata resolverOptions) public override returns (uint256 amountOut) {

    
    (SwapResolverOptions memory swapResolverOptions) = abi.decode(resolverOptions, (SwapResolverOptions));
    return resolveImplementation(amountIn, swapResolverOptions);
}
