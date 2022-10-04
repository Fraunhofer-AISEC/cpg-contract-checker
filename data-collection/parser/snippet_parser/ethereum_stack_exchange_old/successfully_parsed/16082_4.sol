pragma solidity ^0.5.0;

library L{
    address public constant t = 0x2020202020202020202020202020202020202020;

    function tAddress() public pure returns(address){
        return t;
    }
}

contract C{
    function getAddress() public pure returns(address){
        return L.tAddress();
    }
}
