
pragma solidity ^0.8.2

import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/token/ERC20/ERC20Upgradeable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/security/PausableUpgradeable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/access/OwnableUpgradeable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/proxy/utils/Initializable.sol";

contract Lumerin is Initializable, ERC20Upgradeable, ERC20BurnableUpgradeable, PausableUpgradeable, OwnableUpgradeable {

constructor() initializer {}                                               
                                                                              
function initialize() initializer public {
__ERC20_init("Token", "TKN");
__ERC20Burnable_init();
__Pausable_init();
__Ownable_init();

_mint(msg.sender, 1000000000 * 10 ** 8);
}

function pause() public onlyOwner {
_pause();
}

function unpause() public onlyOwner {
_unpause();
}

function _beforeTokenTransfer(address from, address to, uint256 amount)
internal
whenNotPaused
override
{
super._beforeTokenTransfer(from, to, amount);
}
}`
