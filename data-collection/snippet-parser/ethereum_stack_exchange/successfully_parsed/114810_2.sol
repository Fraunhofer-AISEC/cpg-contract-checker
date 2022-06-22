
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/access/AccessControlEnumerableUpgradeable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/token/ERC20/ERC20Upgradeable.sol";

contract MyContract is AccessControlEnumerableUpgradeable, ERC20Upgradeable {

    bytes32 public constant THECOIN_ROLE = keccak256("THECOIN_ROLE");
    
    
    
    function initialize() initializer() public {
        
        
        
        __AccessControlEnumerable_init();

        
        
        __ERC20_init_unchained("THE_COIN_NAME", "THE_COIN_SYMBOL");

        
        
        
        hasRole(THECOIN_ROLE, msg.sender);
    }
}
