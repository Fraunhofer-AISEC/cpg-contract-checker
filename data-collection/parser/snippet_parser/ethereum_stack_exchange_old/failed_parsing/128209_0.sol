Transaction sent: 0x9158e07b307a9c77974bec4e7182ad7aae24e8f18d80b09de60ac22c637dcd55
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 5
  LandLord.transferToAave confirmed (SafeERC20: low-level call failed)   Block: 14774532   Gas used: 173499 (1.45%)

  File "brownie/_cli/run.py", line 51, in main
    return_value, frame = run(
  File "brownie/project/scripts.py", line 103, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File "./scripts/deploy.py", line 272, in main
    send_to_aave()
  File "./scripts/deploy.py", line 250, in send_to_aave
    transfer_to_aave(
  File "./scripts/deploy.py", line 219, in transfer_to_aave
    tx = land_contract.transferToAave(amount, {"from": account})
  File "brownie/network/contract.py", line 1710, in __call__
    return self.transact(*args)
  File "brownie/network/contract.py", line 1583, in transact
    return tx["from"].transfer(
  File "brownie/network/account.py", line 682, in transfer
    receipt._raise_if_reverted(exc)
  File "brownie/network/transaction.py", line 446, in _raise_if_reverted
    raise exc._with_attr(
VirtualMachineError: revert: SafeERC20: low-level call failed
Trace step -1, program counter 263:
  File "contracts/LandLord.sol", line 63, in LandLord.transferToAave:    
        

        
        aavePool.deposit(address(tokenUsedForPayments), _amount, address(msg.sender), 0);
        
        
    }
Terminating local RPC client...
