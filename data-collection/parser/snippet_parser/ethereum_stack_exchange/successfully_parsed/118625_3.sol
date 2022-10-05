function call(string calldata functionSignature, bytes calldata parameters) 
    external returns(bytes memory) {
    
    (bool success, bytes memory data) = address(this).delegatecall(
        abi.encodeWithSelector(
            bytes4(
                keccak256(bytes(functionSignature))
            ),
            parameters
        )
    );
    require(success, 'Call failed');
    return data;
}
