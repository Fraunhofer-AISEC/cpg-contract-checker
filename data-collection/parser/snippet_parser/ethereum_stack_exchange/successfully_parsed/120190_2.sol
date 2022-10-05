pragma solidity ^0.8.0;

interface ICounter {

    function count() external view returns (uint256);
    function increment() external;
}

contract myInterface {

    function incrementCount(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint256) {
        return ICounter(_counter).count();
    }
}
