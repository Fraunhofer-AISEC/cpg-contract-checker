const contractTx: ContractTransaction = await tokenA.mint(owner.address, 500)
const contractReceipt: ContractReceipt = await contractTx.wait()
const event = contractReceipt.events?.find(event => event.event === 'TokensMinted')
const amountMintedFromEvent: BigNumber = event?.args!['amount']
