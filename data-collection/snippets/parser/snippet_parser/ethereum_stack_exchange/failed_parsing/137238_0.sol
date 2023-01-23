store_transaction = Voting_Contract.functions.addPoll("First Test.").buildTransaction(
{
    "gasPrice": w3.eth.gas_price,
    "chainId": chain_id,
    "from": my_address,
    "nonce": nonce + 1,
}  # this is creating a transaction

signed_store_txn = w3.eth.account.sign_transaction(
store_transaction, private_key=private_key
)
# we send the transaction
send_store_tx = w3.eth.send_raw_transaction(signed_store_txn.rawTransaction)
print("Contract Updated.")
# we wait for the transaction to finish
tx_receipt = w3.eth.wait_for_transaction_receipt(send_store_tx) 
