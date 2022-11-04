uint gasPerCall = msg.gas / callbacks.length - 200000;
bytes4 abi = bytes4(sha3("oracleCallback(int256,uint256,bytes32)"));

for(uint i = 0; i < callbacks.length; i++) {
    if (callbacks[i].call.gas(gasPerCall)(abi, _value, _time, _info) == false) {
        FailedCallbackEvent(abi, gasPerCall, msg.gas);
    }
}
