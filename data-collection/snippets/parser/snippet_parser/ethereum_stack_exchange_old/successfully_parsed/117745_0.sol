

pragma solidity 0.8.9;

import "@openzeppelin/contracts/proxy/Proxy.sol";
import "@openzeppelin/contracts/proxy/beacon/IBeacon.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/utils/StorageSlot.sol";

abstract contract MinimalBeaconProxy is proxy {

    bytes32 internal constant _BEACON_SLOT = 0xa3f0ad74e5423aebfd80d3ef4346578335a9a72aeaee59ff6cb3582b35133d50;

    constructor(address beacon) {
        assert(_BEACON_SLOT == bytes32(uint256(keccak256("eip1967.proxy.beacon")) - 1));
        _setBeacon(beacon);
    }

    function _implementation() internal view virtual override returns (address) {
        return IBeacon(_getBeacon()).implementation();
    }

    function _getBeacon() internal view returns (address) {
        return StorageSlot.getAddressSlot(_BEACON_SLOT).value;
    }

    function _setBeacon(address newBeacon) internal {
        require(Address.isContract(newBeacon), "ERC1967: new beacon is not a contract");
        StorageSlot.getAddressSlot(_BEACON_SLOT).value = newBeacon;
    }
}
