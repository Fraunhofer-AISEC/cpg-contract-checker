
interface IResolver {
    
    function resolve(uint256 amount, ResolverOptions calldata resolverOptions) external returns (uint256);

    
   function validateAdditionalCalldata(bytes calldata additionalCalldata) external view;
}
