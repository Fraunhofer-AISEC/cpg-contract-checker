pragma solidity 0.5.8;

contract Cast {

    function weirdResult() public pure returns(uint) {
        uint8 y = 3;
        uint8 x = 10;
        return x**y;
    }
}
