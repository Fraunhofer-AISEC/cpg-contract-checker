pragma solidity 0.5.1;

contract Reason {

    function doSomething() public pure {
        require(false, "Just because");
    }
}
