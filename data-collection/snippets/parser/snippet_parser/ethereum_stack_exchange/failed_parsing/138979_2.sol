    Transaction sent: 0x7ffd26ac40fe40b9eb211b94402b8ddcc60ebb311178755c457b393b34035f87
    Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 20
    BarnaTokenInu.addInitialLiquidity confirmed (TransferHelper: TRANSFER_FROM_FAILED)   
    Block: 15919924   Gas used: 87214 (0.73%)

    File "C:\Users\sma157555\AppData\Local\Programs\Python\Python310\lib\site- 
    packages\brownie\_cli\run.py", line 51, in main
    return_value, frame = run(
    File "C:\Users\sma157555\AppData\Local\Programs\Python\Python310\lib\site- 
    packages\brownie\project\scripts.py", line 110, in run
    return_value = f_locals[method_name](*args, **kwargs)
    File ".\scripts\main.py", line 30, in main
    contract.addInitialLiquidity({"from": account})
    File "C:\Users\sma157555\AppData\Local\Programs\Python\Python310\lib\site- 
    packages\brownie\network\contract.py", line 1861, in __call__
    return self.transact(*args)
    File "C:\Users\sma157555\AppData\Local\Programs\Python\Python310\lib\site- 
    packages\brownie\network\contract.py", line 1734, in transact
    return tx["from"].transfer(
    File "C:\Users\sma157555\AppData\Local\Programs\Python\Python310\lib\site- 
    packages\brownie\network\account.py", line 682, in transfer
    receipt._raise_if_reverted(exc)
    File "C:\Users\sma157555\AppData\Local\Programs\Python\Python310\lib\site- 
    packages\brownie\network\transaction.py", line 446, in _raise_if_reverted
    raise exc._with_attr(
    VirtualMachineError: revert: TransferHelper: TRANSFER_FROM_FAILED
    Trace step -1, program counter 3601:
    File "contracts/BarnaTokenInu.sol", lines 183-190, in BarnaTokenInu.addInitialLiquidity:

    weth.approve(router_address, initialInvestment);
    weth.approve(owner(), initialInvestment);
    router.addLiquidityETH(
        address(this),
        (initialSupply * fractionForOwner) / 100,
        (initialSupply * fractionForOwner) / 100,
        initialInvestment,
        owner(),
        block.timestamp + deadlineForLiquidityProvision
    );
}
