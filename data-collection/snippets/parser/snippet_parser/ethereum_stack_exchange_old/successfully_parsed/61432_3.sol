pragma solidity ^0.4.24;

contract test {

    mapping (address => uint[]) public transactions;

    constructor() public {
        transactions[msg.sender].push(123456);
        transactions[msg.sender].push(789101);
        transactions[msg.sender].push(865436);
    }

    function getTransactions() public view returns (uint[]) {

        return transactions[msg.sender];

    }
}
