pragma solidity ^0.4.0;
contract A {
    uint public b;
    function saveB(uint _b) public {
        b = _b;
    }
}
