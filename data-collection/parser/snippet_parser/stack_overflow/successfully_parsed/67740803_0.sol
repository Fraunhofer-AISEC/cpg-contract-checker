pragma solidity ^0.8.4;

contract Test {

    struct Data {
        string foo;
        address[] bar;
        address ctrt;
    }

    Data public d;

    constructor() {
        d.foo = "HELLO WORLD";
        d.bar.push(msg.sender);
        d.ctrt = address(this);
    }

    function getD() public view returns (Data memory) {
        return d;
    }
}
