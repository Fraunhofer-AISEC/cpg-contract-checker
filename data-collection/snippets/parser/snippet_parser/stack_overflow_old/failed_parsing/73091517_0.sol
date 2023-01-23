
pragma solidity <0.9.0;

import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/IERC20MetadataUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Myvaultis ERC4626Upgradeable, OwnableUpgradeable {
    
    address _cAsset;

    function initialize(
        IERC20MetadataUpgradeable asset_,
        string memory name_,
        string memory symbol_
    ) public initializer {
        __MyVault_init(asset_, name_, symbol_);
        _cAsset = 0x00000000000000000000000; 
    }

    function __MyVault_init(
        IERC20MetadataUpgradeable asset_,
        string memory name_,
        string memory symbol_
    ) internal onlyInitializing {
        __ERC4626_init_unchained(asset_);
        __ERC20_init_unchained(name_, symbol_);
        __Ownable_init_unchained();
    }

    function depositCompound(
        IERC20MetadataUpgradeable asset_,
        address cAsset_,
        uint256 _amount
    ) public onlyOwner returns (uint) {
        asset_.approve(cAsset_, _amount);
        
        uint mintResult = cAsset_.mint(_amount);
        return mintResult;
    }

    function withdrawCompound(
        uint256 amount,
        bool redeemType,
        address cAsset_
    ) public onlyOwner returns (bool) {
        uint256 redeemResult;
        if (redeemType == true) {
            redeemResult = cAsset_.redeem(amount);
        } else {
            redeemResult = cAsset_.redeemUnderlying(amount);
        }
        return true;
    }
}
