pragma solidity ^0.4.8;
contract foo {
    function bar() returns (bytes32 response) {
        address dest = 0x850ec47a0f40e3605a7ba21f1c99b04410090134;
        bytes memory calldata = hex"0bcd3b33";
        assembly {
            let status := delegatecall(sub(gas,5000), dest, add(calldata, 0x20), mload(calldata), response, 32)
            jumpi(invalidJumpLabel, iszero(status))
        }
        return response;
    }
}
