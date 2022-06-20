
pragma solidity ^0.8.3;

contract Proxy {
    mapping(string => address) public strategies;

    function addStrategy(string memory id, address implementation) external {
        strategies[id] = implementation;
    }

    function removeStrategy(string memory id) external {
        delete strategies[id];
    }

    function displayVar(string memory strategyId) external {
        address strategy = strategies[strategyId];
        require(strategy != address(0x0), "Strategy not found..");

        (bool success, bytes memory data) = strategy.delegatecall(
            abi.encodeWithSignature("displayVar()")
        );
    }
}
