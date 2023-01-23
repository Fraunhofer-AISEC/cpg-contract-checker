pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./helpers/TransferHelpers.sol";

contract VefiEcosystemTokenV2 is Ownable, AccessControl, ERC20 {
  using SafeMath for uint256;

  address public taxCollector;
  address[] public liquidityPools;
  address[] public holders;

  bytes32 public taxExclusionPrivilege = keccak256(abi.encode("TAX_EXCLUSION_PRIVILEGE"));

  uint8 public taxPercentage;

  constructor(
    string memory name_,
    string memory symbol_,
    uint256 amount,
    address _taxCollector,
    uint8 _taxPercentage
  ) ERC20(name_, symbol_) {
    taxCollector = _taxCollector;
    taxPercentage = _taxPercentage;
    _mint(_msgSender(), amount);
    _grantRole(taxExclusionPrivilege, _msgSender());
    holders.push(_msgSender());
  }

  function _indexOfList(address[] memory list, address item) internal pure returns (uint256 index) {
    index = uint256(int256(-1));

    for (uint256 i = 0; i < list.length; i++) {
      if (list[i] == item) {
        index = i;
      }
    }
  }

  function _afterTokenTransfer(
    address,
    address to,
    uint256 amount
  ) internal virtual override(ERC20) {
    if (amount > 0) {
      if (_indexOfList(holders, to) == uint256(int256(-1)) && _indexOfList(liquidityPools, to) == uint256(int256(-1))) {
        holders.push(to);
      }
    }
  }

  function _splitFeesFromTransfer(uint256 amount)
    internal
    view
    returns (
      uint256 forHolders,
      uint256 forPools,
      uint256 forTaxCollector
    )
  {
    uint256 totalTaxValue = amount.mul(uint256(taxPercentage)).div(100);
    forHolders = totalTaxValue.div(3);
    forPools = totalTaxValue.div(3);
    forTaxCollector = totalTaxValue.div(3);
  }

  function _transfer(
    address from,
    address to,
    uint256 amount
  ) internal virtual override(ERC20) {
    if (!hasRole(taxExclusionPrivilege, from) && from != address(this)) {
      (uint256 forHolders, uint256 forPools, uint256 forTaxCollector) = _splitFeesFromTransfer(amount);
      uint256 paymentToTaxCollector = forTaxCollector;
      
      address[] memory internalHolders = holders;
      address[] memory holdersWithSufficientBalance = new address[](internalHolders.length);

      for (uint256 i = 0; i < internalHolders.length; i++) {
        if (balanceOf(internalHolders[i]) > 0) {
          holdersWithSufficientBalance[i] = internalHolders[i];
        }
      }

      uint256 countOfZeroAddressesHolders;

      for (uint256 i = 0; i < holdersWithSufficientBalance.length; i++) {
        if (holdersWithSufficientBalance[i] == address(0)) {
          countOfZeroAddressesHolders = countOfZeroAddressesHolders.add(1);
        }
      }

      uint256 amountPerHolders = forHolders.div(holdersWithSufficientBalance.length.sub(countOfZeroAddressesHolders));

      for (uint256 i = 0; i < holdersWithSufficientBalance.length; i++) {
        if (holdersWithSufficientBalance[i] != address(0)) {
          super._transfer(from, holdersWithSufficientBalance[i], amountPerHolders);
        }
      }

      
      address[] memory internalLPs = liquidityPools;

      uint256 countOfZeroAddressesLPs;

      for (uint256 i = 0; i < internalLPs.length; i++) {
        if (internalLPs[i] == address(0)) {
          countOfZeroAddressesLPs = countOfZeroAddressesLPs.add(1);
        }
      }

      if (internalLPs.length > 0) {
        uint256 amountPerLPs = forPools.div(internalLPs.length.sub(countOfZeroAddressesLPs));

        for (uint256 i = 0; i < internalLPs.length; i++) {
          if (internalLPs[i] != address(0)) {
            super._transfer(from, internalLPs[i], amountPerLPs);
          }
        }
      } else {
        paymentToTaxCollector = paymentToTaxCollector.add(forPools);
      }

      super._transfer(from, taxCollector, paymentToTaxCollector);
      super._transfer(from, to, amount.sub(forHolders + forPools + forTaxCollector));
    } else {
      super._transfer(from, to, amount);
    }
  }

  function setTaxPercentage(uint8 _taxPercentage) external onlyOwner {
    taxPercentage = _taxPercentage;
  }

  function setTaxCollector(address _taxCollector) external onlyOwner {
    taxCollector = _taxCollector;
  }

  function excludeFromPayingTax(address account) external onlyOwner {
    require(!hasRole(taxExclusionPrivilege, account), "already_excluded_from_paying_tax");
    _grantRole(taxExclusionPrivilege, account);
  }

  function includeInTaxPayment(address account) external onlyOwner {
    require(hasRole(taxExclusionPrivilege, account), "already_pays_tax");
    _revokeRole(taxExclusionPrivilege, account);
  }

  function addLiquidityPool(address lp) external onlyOwner {
    uint256 index = _indexOfList(liquidityPools, lp);
    require(index == uint256(int256(-1)), "lp_already_in_list");
    liquidityPools.push(lp);
  }

  function removeLiquidityPool(address lp) external onlyOwner {
    uint256 index = _indexOfList(liquidityPools, lp);
    require(index > uint256(int256(-1)), "lp_not_in_list");
    address[] storage lps = liquidityPools;
    delete lps[index];
  }

  function retrieveEther(address to) external onlyOwner {
    TransferHelpers._safeTransferEther(to, address(this).balance);
  }

  function retrieveERC20(
    address token,
    address to,
    uint256 amount
  ) external onlyOwner {
    TransferHelpers._safeTransferERC20(token, to, amount);
  }
}
