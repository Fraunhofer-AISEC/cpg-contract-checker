    Searching...
    Searching...
    AttributeDict({'args': AttributeDict({'token0': 
    '0x956ae65de9922568cf96f654c7dAa64dDd38046F', 'token1': 
    '0xc778417E063141139Fce010982780140Aa0cD5Ab', 'pair': 
    '0xc61E4178aD121C1AA4a17Da57212eA2be566300f', '': 41398}), 'event': 
    'PairCreated', 'logIndex': 10, 'transactionIndex': 4, 'transactionHash': 
    HexBytes('0x49c0eb4aa9b9b89f541897273220c889f8bb7d654d72c1c6e7c432ecdbf1840c'), 
    'address': '0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f', 'blockHash': 
    HexBytes('0xad06da046314128d642f73bdaa4a664fb1cc5f35ea83932a26cb1274abf1176b'), 
    'blockNumber': 9999190})
    Token0: "0xc778417E063141139Fce010982780140Aa0cD5Ab"
    Token1: "0x956ae65de9922568cf96f654c7dAa64dDd38046F"
    New Pair Created...
    Transaction sent: 
            0x5cffa432f8443db2a53577b76fe556f0186beae722a9c36e26a0e282096080b0
      Gas price: 1.099999952 gwei   Gas limit: 146978   Nonce: 861
      UniswapV2Router02.swapExactETHForTokens confirmed (reverted)   Block: 9999191   
            Gas used: 145909 (99.27%)

      File "brownie/_cli/run.py", line 50, in main
        return_value, frame = run(
      File "brownie/project/scripts.py", line 103, in run
        return_value = f_locals[method_name](*args, **kwargs)
      File "./scripts/sniper.py", line 63, in main
        loop.run_until_complete(
      File "/usr/lib/python3.8/asyncio/base_events.py", line 616, in 
            run_until_complete
        return future.result()
      File "./scripts/sniper.py", line 54, in log_loop
        handle_event(PairCreated)
      File "./scripts/sniper.py", line 42, in handle_event
        buy()
      File "./scripts/sniper.py", line 26, in buy
        tx = uni_router.swapExactETHForTokens(0, path, account, time_until_revert, {
      File "brownie/network/contract.py", line 1629, in __call__
       return self.transact(*args)
      File "brownie/network/contract.py", line 1502, in transact
        return tx["from"].transfer(
      File "brownie/network/account.py", line 682, in transfer
        receipt._raise_if_reverted(exc)
      File "brownie/network/transaction.py", line 428, in _raise_if_reverted
        raise exc or ValueError("Execution reverted")
            ValueError: Execution reverted
      
