pragma solidity ^0.4.0;
contract C {
    uint[] data1;
    uint[] data2;

    function appendOne() {
        append(data1);
    }

    function appendTwo() {
        append(data2);
    }

    function append(uint[] storage d) internal{
        d.push(1);
    }
}
