if int(f.json()["inputAmount"]) != 0:
    nonce = w.eth.get_transaction_count(acc)
    router = w.eth.contract(address=a, abi=abi)


    txn = router.functions.swapExactTokensForTokens(
        aIn,  # Amount in uint256
        0,  # Min amount out uint256
        poolPath,  # address[] calldata poolspath
        tokenPath,  # IERC20[] calldata path
        acc,  # address to
        int(time.time()) + 1000,  # deadline uint 256
    ).buildTransaction(
        {
            "from": acc,
            "value": aIn,
            "gas": int(f.json()["totalGas"]),
            "gasPrice": int(w.eth.generate_gas_price()),
            "nonce": nonce,
        }
    )
    sgnTxn = w.eth.account.sign_transaction(
        txn,
        private_key=acc1,
    )
    txn_token = w.eth.sendRawTransaction(sgnTxn.rawTransaction)
    print(txn_token)
else:
    print("no swap!")
