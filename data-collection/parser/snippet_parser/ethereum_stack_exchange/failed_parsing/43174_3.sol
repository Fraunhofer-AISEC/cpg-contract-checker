bytes32 function_code = bytes4(keccak256("isSafe()"));
bool isSafe = false;
assembly {
    mstore(0, function_code)
    sucess := call(sub(gas, 1000), iSafe, 0,0, 4, 0, 32)
    isSafe := and(success, mload(0))
}
