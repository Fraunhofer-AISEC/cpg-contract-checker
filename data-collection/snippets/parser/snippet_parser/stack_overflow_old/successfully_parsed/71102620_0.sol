pragma solidity ^0.8.2;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20SnapshotUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract Token is
  Initializable,
  ERC20Upgradeable,
  ERC20SnapshotUpgradeable,
  OwnableUpgradeable,
  PausableUpgradeable
{
  
  constructor() initializer {}

  function initialize() public initializer {
    __ERC20_init("Token", "TKN");
    __ERC20Snapshot_init();
    __Ownable_init();
    __Pausable_init();

    _mint(msg.sender, 10000000000 * 18**decimals());
  }

  function snapshot() public onlyOwner {
    _snapshot();
  }

  function pause() public onlyOwner {
    _pause();
  }

  function unpause() public onlyOwner {
    _unpause();
  }

  function _beforeTokenTransfer(
    address from,
    address to,
    uint256 amount
  )
    internal
    override(ERC20Upgradeable, ERC20SnapshotUpgradeable)
    whenNotPaused
  {
    super._beforeTokenTransfer(from, to, amount);
  }
}
