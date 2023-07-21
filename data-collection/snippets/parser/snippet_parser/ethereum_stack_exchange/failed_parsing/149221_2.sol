def swap(self, router: ChecksumAddress, recipient: ChecksumAddress, token1: ChecksumAddress,
         token2: ChecksumAddress,
         amount: int, fee: int = 3000, slippage: int = 1, secs: int = 60):
    print(router, recipient, token1, token2, amount, fee, slippage, secs)
    print('[+] Performing checks ... ')
    current_balance = self.token_balance(token1, True)
    assert current_balance >= amount
    current_allowance = self.token_allowance(token1)
    if amount > current_allowance:
        print('[+] Must approve contract to spend tokens ... ')
        txid = self.approve_trade_proxy(token1)
        self.wallet.poll_receipt(txid)
    # data = self.encode_swap(router, recipient, token1, token2, fee, amount, slippage, secs)
    tx = {
        "from": self.account.address,
        "to": self.contract_address,
        "data": self._contract.encodeABI('swap',
                                         args=(router, recipient, token1, token2, fee, amount, slippage, secs)),
        "value": 0,
        "chainId": self.w3.eth.chain_id
    }
    return self.wallet.broadcast_raw_tx(tx)
