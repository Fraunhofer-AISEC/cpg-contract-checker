pragma solidity ^0.5.0;

contract First {
    int internal age1 = 40;
    int public age2 = 50;
    int private age3 = 60;
    int public constant age4 = 70;

    function getAge1() public view returns (int) {
        return age1;
    }

    function getAge2() public view returns (int) {
        return age2;
    }

    function getAge3() public view returns (int) {
        return age3;
    }

}
