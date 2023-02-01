function executeTransactions(address[] targets, uint[] values, string[] memory signatures, bytes[] memory data) public payable returns (bytes memory) 

    bytes memory callData;
    for(uint i = 0; i < targets.length; i++){
        
        if (bytes(signatures[i]).length == 0) {
            callData = data[i];
        } else {
            callData = abi.encodePacked(bytes4(keccak256(bytes(signatures[i]))), data[i]);
        }

        
        (bool success, bytes memory returnData) = targets[i].call.value(values[i])(callData);
        require(success, "Timelock::executeTransaction: Transaction execution reverted.");

        return returnData;
    }
}
