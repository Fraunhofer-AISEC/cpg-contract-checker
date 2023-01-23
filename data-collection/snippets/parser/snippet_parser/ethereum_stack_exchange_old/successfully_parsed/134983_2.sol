
pragma solidity ^0.8.6;

contract Counter {

    uint256 public counter;

    function updateCounter() public {
        counter++;
    }

    fallback() external payable {
        counter++;
    }

}
