pragma solidity ^0.4.21;

contract Test {

    mapping(int => uint8) one;
    mapping(int => uint256) two;
    int counter = 0;

    function pushOne() public {
        one[counter++] = 1;
    }

    function pushTwo() public {
        two[counter++] = 256;
    }

}
