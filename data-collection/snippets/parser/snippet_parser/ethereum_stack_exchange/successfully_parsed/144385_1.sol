
pragma solidity ^0.8.17;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Script.sol";

interface IHuff {
    function provideValue(uint32) external;

    function getResult() external returns (uint256);
}

contract Deploy is Script {
    function run() public returns (IHuff iHuff) {
        iHuff = IHuff(HuffDeployer.deploy("HuffContract"));
    }
}
