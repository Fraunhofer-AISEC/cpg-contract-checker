pragma solidity ^0.7.0;

interface IOtherContr {
    function doStuff(uint256 some) external;
}

contract Test {
    function doSomething(address otherContr) public {
        IOtherContr ref = IOtherContr(otherContr);
        ref.doStuff(65);
    }
}
