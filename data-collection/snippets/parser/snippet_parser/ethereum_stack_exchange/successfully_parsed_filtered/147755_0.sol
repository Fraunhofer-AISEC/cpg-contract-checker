
pragma solidity ^0.8.17;

contract EXT {
    uint256 public A = 0;

    function setA(uint256 _a) public {
        A = _a;
    }
}

contract LOC {
    uint256 public B;
    EXT externalContract;

    function setAddress(address _address) public {
        externalContract = EXT(_address);
    }

    function doStuff() public {
        externalContract.setA(1);
        B = externalContract.A();
    }
}
