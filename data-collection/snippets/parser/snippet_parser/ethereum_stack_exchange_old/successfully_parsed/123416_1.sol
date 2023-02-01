
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/utils/UUPSUpgradeable.sol";

contract TokenPoolFactory is UUPSUpgradeable {

    
    function _authorizeUpgrade(address newImplementation) internal virtual override {
        
    }

    function testProxy() external view onlyProxy returns (uint8) {
        return 42;
    }
}

