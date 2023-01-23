pragma solidity ^0.4.17;

import "browser/TestA02.sol";

contract TestA01 {

    TestA02 T2;

    constructor() public {
        T2 = new TestA02();
    }

    function genEntry(address a) public {
        T2.add(a);
    }

    function get() public view returns(address) {return(T2.get(0));}
    function get(uint i) view public returns(address) {return(T2.get(i));}

    function getSize() public view returns(uint) {return(T2.getSize());}

    function getT2() public view returns(address) {return(address(T2));}
}
