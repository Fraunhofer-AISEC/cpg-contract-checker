
pragma solidity 0.8.11;

import "@openzeppelin/contracts/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Proxy is UUPSUpgradeable, Ownable {

    constructor(address _impl) {
        _upgradeTo(_impl);
    }
    
    function _authorizeUpgrade(address) internal override onlyOwner {}
}
