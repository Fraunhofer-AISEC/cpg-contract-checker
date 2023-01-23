def liquidCheck(self, address, methodType):
        tx_filter = self.w3.eth.filter({"filter_params":"pending","address": Web3.toChecksumAddress(address)})
        loop = asyncio.get_event_loop()
        try:
            inputHex = loop.run_until_complete(
                asyncio.gather(
                    self.log_loop(tx_filter, methodType)))
        except Exception as e:
            print(e)
            self.liquidCheck(address, methodType)
        else:
            loop.stop()
            loop.close()

    async def log_loop(self, event_filter, methodType):
        if isinstance(methodType, bool) and methodType:
            methodId = "0x267dd102"
        elif isinstance(methodType, bool) and not methodType:
            methodId = "0xf305d719"
        else:
            methodId = "0x095ea7b3" #UniCrypt
        print(methodId)
        while True:
            for event in event_filter.get_new_entries():
                tx = self.w3.eth.get_transaction(event.transactionHash)
                inputHex = tx.input
                if inputHex[0:10].lower() != methodId.lower():
                    self.swap()
                    print(tx.hash.hex())
                return inputHex 
