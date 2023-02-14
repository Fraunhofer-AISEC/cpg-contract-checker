pragma solidity ^0.4.20;

contract Test {
    uint public _val;

    mapping(uint => bytes4) _methodToInvoke;

    function Test() public {
        _methodToInvoke[1] = bytes4(keccak256("incrementBy1()"));
        _methodToInvoke[2] = bytes4(keccak256("incrementBy2()"));
    }

    function incrementBy1() public {
        _val++;
    }

    function incrementBy2() public {
        _val += 2;
    }

    function invoke(uint idx) public returns (bool) {
        return this.call(_methodToInvoke[idx]);
    }
}
