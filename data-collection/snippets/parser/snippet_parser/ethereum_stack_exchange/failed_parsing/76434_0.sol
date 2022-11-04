1)

import "./MaintainableUpgradeabilityProxy.sol";

function _createProxy(address implementation, address serviceRegistry) internal returns (MaintainableUpgradeabilityProxy) {
    MaintainableUpgradeabilityProxy proxy = new MaintainableUpgradeabilityProxy(implementation, serviceRegistry);
    emit ProxyCreated(proxy, msg.sender);
    return proxy;
  }
