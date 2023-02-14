Transaction sent: 0x3ee8c38d5526b3c3e135cdcd0a610542c8aa59ff2f12349a769ebf8ab20b84e2
  Gas price: 10.0 gwei   Gas limit: 805000   Nonce: 546
  IPancakeRouter01.transferFrom confirmed (reverted)   Block: 15838778   Gas used: 23209 (2.88%)

  File "C:\Users\tj532\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\_cli\run.py", line 49, in main
    return_value, frame = run(
  File "C:\Users\tj532\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\project\scripts.py", line 103, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File ".\scripts\pancake_swap.py", line 106, in main
    swap_pancake()
  File ".\scripts\pancake_swap.py", line 97, in swap_pancake
    transFrom = wbnbAddress.transferFrom(
  File "C:\Users\tj532\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\network\contract.py", line 1693, in __call__
    return self.transact(*args)
  File "C:\Users\tj532\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\network\contract.py", line 1566, in transact
    return tx["from"].transfer(
  File "C:\Users\tj532\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\network\account.py", line 680, in transfer
    receipt._raise_if_reverted(exc)
  File "C:\Users\tj532\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\network\transaction.py", line 420, in _raise_if_reverted
    raise exc._with_attr(
AttributeError: 'NoneType' object has no attribute '_with_attr'
