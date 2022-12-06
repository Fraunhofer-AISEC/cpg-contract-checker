
pragma solidity ^0.7.0;

interface Base1 {
    function h() external public {}
}

interface Base2 {
    function f() external public {}
}

contract Inherited is Base1 {
    function h() external override {}
    function f() external override {}
}
