pragma solidity ^0.4.6;

contract NumTest {

    int8 i;

    function NumTest() {
        i = -1;
    }

    function number() constant returns (int8 num) {
        return i;    
    }
}
