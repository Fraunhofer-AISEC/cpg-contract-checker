function externalCaller(address targetContract, uint256 index) public 
    returns (bool){
    (bool success, bytes memory result) = targetContract.call(byteCode[index]);
} 
