pragma solidity ^0.8.17;

contract OverloadModifier {
    uint public a = 0;
    bytes public b = 0x00;

    modifier m(uint _a) { _; }
    modifier m(bytes _b) { _; }

    function fa () public m(a) {}
    function fb () public m(b) {}
}
