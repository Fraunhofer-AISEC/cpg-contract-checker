Transaction sent: 0x51706233d36caf15a92ba04c599a38c3203b4feed005abbc01c6d6adc6d81b7d
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 1
  AlgoToken.buy confirmed (ERC20: insufficient allowance)   Block: 6   Gas used: 280614 (2.34%)

Traceback (most recent call last):
  File "tests/test-price-growth-algo-token.py", line 197, in <module>
    buy(big_balance(1000.345672))
  File "tests/test-price-growth-algo-token.py", line 138, in buy
    contract_function = algoToken.buy(USD_amount)
  File "/home/steve/.local/lib/python3.8/site-packages/brownie/network/contract.py", line 1864, in __call__
    return self.transact(*args)
  File "/home/steve/.local/lib/python3.8/site-packages/brownie/network/contract.py", line 1737, in transact
    return tx["from"].transfer(
  File "/home/steve/.local/lib/python3.8/site-packages/brownie/network/account.py", line 682, in transfer
    receipt._raise_if_reverted(exc)
  File "/home/steve/.local/lib/python3.8/site-packages/brownie/network/transaction.py", line 446, in _raise_if_reverted
    raise exc._with_attr(
brownie.exceptions.VirtualMachineError: revert: ERC20: insufficient allowance
Trace step -1, program counter 4635:
  File "contracts/price-growth-algo-token.sol", line 274, in AlgoToken.buy:
        idealized_Mcap = K_target.mul(f_slip).add(f_peg);
        target_Mcap = price.mul(f_hyp_supply);

        stable_coin.transferFrom(msg.sender, address(this), $USD_amount);
        _mint(msg.sender, algos_to_mint);

    }
