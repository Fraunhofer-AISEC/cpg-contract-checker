contract ArbitraryFunctions is IArbitraryFunctions {
    uint public stateVar;
    address public stateAddr;
    function first(uint val, address addr) public override {
        
    }
}

contract CallsFunctions {
    
    function callArbitraryFunctionsContract(address contractAddress, uint callVal, address callAddr) public {
        ArbitraryFunctions(contractAddress).first(callVal, callAddr);
    }
    
    
    function callAnything(address contractAddress, bytes memory args) public {
        (bool success, ) = contractAddress.call(args);
        require(success);
        
    }
}
