pragma solidity ^0.4.24;

contract Called {
    string info = "default";

    function setInfo(string _info) public {
        info = _info;
    }

    function getInfo() view public returns (string) {
        return info;
    }

}

contract Caller {

    Called called;

    constructor(address addr) public {
        called = Called(addr);
    }

    function setInfo(string _info) public {
        called.setInfo(_info);
    }

    function getInfo() view public returns (string) {
        return called.getInfo();
    }

}
