# Crowd-sale contract address of solidity smart contract
crowdsale_contract_address = crowdsale_tx_receipt['contractAddress']
# print(crowdsale_contract_address)

# Crowdsale instance in concise mode
crowd_sale_abi = crowdsale_intrface['abi']
crowdsale_instance = w3.eth.contract(address=crowdsale_contract_address,
                                                abi=crowd_sale_abi, ContractFactoryClass=ConciseContract)
no_of_token = 5
token_price = 1000000000000000
print(w3.eth.estimateGas)
print(crowdsale_instance.buyTokens(no_of_token,transact={'from':w3.eth.accounts[4],'value':token_price , 'gas': 500000}))
