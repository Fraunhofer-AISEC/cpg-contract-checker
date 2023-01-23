pragma solidity ^0.5.11;

contract Deployer {
    constructor() public {
        bytes memory bytecode = hex'61000061000061000061000061006161000301610000619789f100';
        assembly {
            return (add(bytecode, 0x20), mload(bytecode))
        }
    }
}
