
pragma solidity ^0.8.10;

import "openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";

contract Proxy is UUPSUpgradeable {
    constructor(address implementation) {
        
        
    }


    function _authorizeUpgrade(
        address newImplementation
    ) internal virtual override {}
}
