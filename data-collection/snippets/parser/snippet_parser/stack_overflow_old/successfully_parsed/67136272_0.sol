
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/presets/ERC20PresetMinterPauserUpgradeable.sol";


contract Paddy is Initializable, ERC20PresetMinterPauserUpgradeable {
    
    function initializePaddy(string memory _name, string memory _symbol) public initializer{
        
        ERC20PresetMinterPauserUpgradeable.initialize(_name, _symbol); 
    }
}
