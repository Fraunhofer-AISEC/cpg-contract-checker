
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/presets/ERC20PresetMinterPauserUpgradeable.sol";

import "./Paddy.sol";


contract IcoSeller is Initializable {
    ERC20PresetMinterPauserUpgradeable paddy;

    function initializeIcoDeployer() public initializer{ 
        paddy.initialize("PaddyCoin", "PADDY"); 
    }

    
    function sellToPublic(address _to, uint _amount) public{
        paddy.mint(_to, _amount);
    }

   
    function getTokenNameFromPaddy() public view
     returns(string memory name){
        return paddy.name();
    }
}
