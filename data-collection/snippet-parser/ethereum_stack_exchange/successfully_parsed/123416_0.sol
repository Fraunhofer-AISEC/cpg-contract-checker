
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/Proxy.sol";
import "@openzeppelin/contracts/utils/StorageSlot.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract TokenPoolFactoryProxy is Proxy {
    
    constructor(address _logic) payable {
        _setImplementation(_logic);
    }

    
    
    function _implementation() internal view virtual override returns (address) {
        return _getImplementation();
    }

    
    
    
    
    
    function _getImplementationSlot() private view returns (bytes32){
        
        
        return 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
    }

    
    
    
    function _getImplementation() private view returns (address) {
        return StorageSlot.getAddressSlot(_getImplementationSlot()).value;
    }

    
    
    function _setImplementation(address newImplementation) private {
        require(Address.isContract(newImplementation), "ERC1967: new implementation is not a contract");
        StorageSlot.getAddressSlot(_getImplementationSlot()).value = newImplementation;
    }
}
