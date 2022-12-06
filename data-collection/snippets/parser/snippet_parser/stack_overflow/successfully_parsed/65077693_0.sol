pragma solidity >=0.4.25 <0.8.0;


contract Calculator {
    uint public result;

    event Added(address caller, uint a, uint b, uint res);

    constructor() public {
        result = 777;
    }

    function add(uint a, uint b) public returns (uint, address) {
        result = a + b;
        emit Added(msg.sender, a, b, result);
        return (result, msg.sender);
    }
}
