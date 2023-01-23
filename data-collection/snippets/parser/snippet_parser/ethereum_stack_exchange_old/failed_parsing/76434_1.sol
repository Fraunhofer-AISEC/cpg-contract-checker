2)
pragma solidity ^0.4.22;

import "zos-lib/contracts/upgradeability/UpgradeabilityProxy.sol";
import "../registry/interface/IServiceRegistry.sol";



contract MaintainableUpgradeabilityProxy is UpgradeabilityProxy {

  
  event ServiceRegistryChanged(address previousRegistry, address newRegistry);

  
  bytes32 private constant ADMIN_SLOT = 0x10d6a54a4754c8869d6886b5f5d7fbfa5b4522237ea5c60d11bc4e7a1ff9390b;

  
  modifier ifMaintainer() {
    if (IServiceRegistry(_serviceRegistry()).getMaintainerRegistryV1().isMaintainer(msg.sender)) {
      _;
    } else {
      _fallback();
    }
  }

  
  constructor(address _implementation, address _serviceReg) UpgradeabilityProxy(_implementation) public {
    assert(ADMIN_SLOT == keccak256("org.zeppelinos.proxy.admin"));
    _setServiceRegistry(_serviceReg);
  }

  
  function implementation() external view ifMaintainer returns (address) {
    return _implementation();
  }

  
  function changeServiceRegistry(address _newRegistry) external ifMaintainer {
    require(_newRegistry != address(0), "New registry cannot be address(0)");
    emit ServiceRegistryChanged(_serviceRegistry(), _newRegistry);
    _setServiceRegistry(_newRegistry);
  }

  
  function upgradeTo(address newImplementation) external ifMaintainer {
    _upgradeTo(newImplementation);
  }

  
  function upgradeToAndCall(address _implementation, bytes data) external payable ifMaintainer {
    _upgradeTo(_implementation);
    
    require(address(this).call.value(msg.value)(data), "Call failed");
  }

  
  function _serviceRegistry() internal view returns (address _serviceReg) {
    bytes32 slot = ADMIN_SLOT;
    
    assembly {
      _serviceReg := sload(slot)
    }
  }

  
  function _setServiceRegistry(address _serviceReg) internal {
    bytes32 slot = ADMIN_SLOT;

    
    assembly {
      sstore(slot, _serviceReg)
    }
  }

  
  function _willFallback() internal {
    require(
      !IServiceRegistry(_serviceRegistry()).getMaintainerRegistryV1().isMaintainer(msg.sender),
      "Maintainer cannot call fallback functions");
    super._willFallback();
  }
}

