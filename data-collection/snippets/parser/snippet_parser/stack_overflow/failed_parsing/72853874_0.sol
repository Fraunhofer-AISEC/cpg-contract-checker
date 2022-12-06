
    
    pragma solidity ^0.8.13;
    
    import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
    
    abstract contract ERC1155OpenSeaGassLess is ERC1155 {
      address public _openSeaProxyRegistryAddress;
    
      constructor(address openSeaProxyRegistryAddress_) {
        _openSeaProxyRegistryAddress = openSeaProxyRegistryAddress_;
      }
    
      function _setOpenSeaProxyRegistryAddress(address openSeaProxyRegistryAddress_) internal virtual {
        _openSeaProxyRegistryAddress = openSeaProxyRegistryAddress_;
      }
    
      function isApprovedForAll(address _owner, address operator) public view virtual override returns (bool) {
        if (_openSeaProxyRegistryAddress != address(0)) {
          **OpenSeaProxyRegistry proxyRegistry = OpenSeaProxyRegistry(_openSeaProxyRegistryAddress);
          if (address(proxyRegistry.proxies(_owner)) == operator)** {
            return true;
          }
        }
        return super.isApprovedForAll(_owner, operator);
      }
    }
    
    contract OwnableDelegateProxy {}
    
    contract OpenSeaProxyRegistry {
      mapping(address => OwnableDelegateProxy) public proxies;
    }
