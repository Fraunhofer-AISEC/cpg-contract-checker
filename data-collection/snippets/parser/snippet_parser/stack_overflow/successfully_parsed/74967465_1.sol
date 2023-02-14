struct fooResolverOptions {
    address[] fooAddresses; 
    uint256[] fooAmounts; 
}

contract FooResolver is IResolver {

    
    function validateAdditionalCalldata(bytes calldata additionalCalldata) view external {
        
        bytes memory additionalCalldataMemory = additionalCalldata;

        
        FooResolverOptions memory fooOptions;
        bool success = abi.decode(additionalCalldataMemory, fooOptions);
    

        
        require(success, "Invalid additional calldata");
    }
}
