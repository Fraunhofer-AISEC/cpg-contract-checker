pragma solidity ^0.4.16;

contract Test {
    address[] owners;

    function addOwner(address newOwner) external {
        owners.push(newOwner);
    }
}
