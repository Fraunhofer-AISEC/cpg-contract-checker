pragma solidity 0.8.6;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "./SupplyChain.sol";

contract SupplyChainFactory {
    
    address immutable proxyImplementation;
    
    constructor() public {
        proxyImplementation = address(new SupplyChain());
    }
    
    function createSupplyChain() external returns (address) {
        address clone = Clones.clone(proxyImplementation);
        SupplyChain(clone).initialize();
        return clone;
    }
}
