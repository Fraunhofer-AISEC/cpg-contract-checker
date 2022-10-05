pragma solidity ^0.5.2;
contract b {
    mapping(uint => function()) funcMap;

    function g() public pure {
        uint x=0;
    }

    function update() public {
        funcMap[1] = g;
    }

}
