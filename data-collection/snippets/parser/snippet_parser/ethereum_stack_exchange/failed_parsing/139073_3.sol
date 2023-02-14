    def test_fund(vaultContract, tokenContract):
        assert vaultContract.funded() == False
        tokenContract.transfer(accounts[0], 10000, {"from": accounts[2]})
        tokenContract.approve(accounts[0], 10000, {"from": accounts[2]})
>       vaultContract.fund(tokenContract.address, 100, 10, {"from": accounts[0]})
E       brownie.exceptions.VirtualMachineError: revert: ERC20: insufficient allowance
E       Trace step -1, program counter 827:
E         File "contracts/VestingVault.sol", line 43, in VestingVault.fund:    
E           if(lockedTime <= 0) revert InsufficientLockedTimeError(lockedTime);
E       
E           token = IERC20(tokenAddress);
E           **token.transferFrom(msg.sender, address(this), amount);**
E           emit ERC20Funded(tokenAddress, amount);
E        
E           funded = true;

tests/test_vestingVault.py:25: VirtualMachineError
