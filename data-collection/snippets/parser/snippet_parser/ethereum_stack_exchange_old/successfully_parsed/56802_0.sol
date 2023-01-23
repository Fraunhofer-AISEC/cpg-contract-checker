pragma solidity ^0.4.24;

contract A {
    function go() public pure returns (uint out) {
        out = 1;
    }
}
contract B {
    function go() public pure returns (uint out) {
        out = 2;
    }
}
contract C {
    function go() public pure returns (uint out) {
        out = 3;
    }
}


contract AB is A, B {
    function go() public pure returns (uint out) {
       out = super.go();
    }
}


contract BA is B, A {
    function go() public pure returns (uint out) {
       out = super.go();
    }
}


contract AC is A, C {
    function go() public pure returns (uint out) {
       out = super.go();
    }
}










contract AC_AB is AC, AB {
    function go() public pure returns (uint out) {
       out = super.go();
    }
}


contract AC_BA is AC, BA {
    function go() public pure returns (uint out) {
       out = super.go();
    }
}
