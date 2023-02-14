pragma solidity 0.5.11;

contract Counter {

    uint256 public counter;

    function increment() external {
        counter = counter + 1;
    }

    function doSelfDestruct() external {
        selfdestruct(0x0000000000000000000000000000000000000000);
    }

    function() external payable {}
}
