contract SomeContract {
    function any() public {
        (bool success, bytes memory result) = addr.call(abi.encodeWithSignature("myFunction(uint,address)", 10, msg.sender);
        
        (uint a, uint b) = abi.decode(result, (uint, uint)); 
    }
}

