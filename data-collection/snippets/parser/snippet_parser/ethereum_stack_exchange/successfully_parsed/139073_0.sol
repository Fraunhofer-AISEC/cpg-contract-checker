
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error BeneficiaryZeroAddressError(address beneficiary);
error AlreadyFundedError(bool funded);
error TokenZeroAddressError(address token);
error InsufficientFundAmountError(uint256 amount);
error InsufficientLockedTimeError(uint256 lockedTime);
error WithdrawerNotBeneficiaryError(address beneficiary);
error VaultNotFundedError(bool funded);
error UnlockTimeNotPassedError();

contract VestingVault is Ownable{
    event ERC20Funded(address token, uint256 amount);
    event ERC20Withdrawn(address token, uint256 amount);

    address private immutable _beneficiary;
    address public tokenVestedAddress;
    uint256 public amountVested;
    uint256 public unlockTime;
    bool public funded = false;
    IERC20 public token;

    constructor(address beneficiary) {
        if(beneficiary == address(0)) revert BeneficiaryZeroAddressError(beneficiary);
        _beneficiary = beneficiary;
    }

    

    function fund(address tokenAddress, uint256 amount, uint256 lockedTime) public onlyOwner {
        if(funded) revert AlreadyFundedError(funded);
        if(tokenAddress == address(0)) revert TokenZeroAddressError(address(tokenAddress));
        if(amount <= 0) revert InsufficientFundAmountError(amount);
        if(lockedTime <= 0) revert InsufficientLockedTimeError(lockedTime);

        token = IERC20(tokenAddress);
        token.transferFrom(msg.sender, address(this), amount);
        emit ERC20Funded(tokenAddress, amount);

        funded = true;
        tokenVestedAddress = tokenAddress;
        amountVested = amount;
        unlockTime = block.timestamp + lockedTime;
    }

    function withdraw() public {
        if(msg.sender != getBeneficiary()) revert WithdrawerNotBeneficiaryError(getBeneficiary());
        if(!funded) revert VaultNotFundedError(funded);
        if(block.timestamp < unlockTime) revert UnlockTimeNotPassedError();

        token = IERC20(tokenVestedAddress);
        token.transfer(getBeneficiary(), amountVested);
        emit ERC20Withdrawn(tokenVestedAddress, amountVested);
    }

    

    function getBeneficiary() public view returns (address) {
        return _beneficiary;
    }

    function getAmountVested() public view returns (uint256) {
        return amountVested;
    }

    function getUnlockTime() public view returns (uint256) {
        return unlockTime;
    }

    function getTimeUntilUnlocked() public view returns (uint256) {
        return unlockTime - block.timestamp;
    }
}
