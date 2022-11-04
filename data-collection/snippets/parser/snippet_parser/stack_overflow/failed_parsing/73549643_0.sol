from solcx import compile_source, compile_files

source = '''
pragma solidity >=0.4.22 <0.9.0;

contract TruffleTutorial {
}
'''
compiled_sol = compile_source(
    source,
    output_values=["abi", "bin-runtime"],
    solc_version="0.8.9")

contract_id, contract_interface = compiled_sol.popitem()
bytecode = contract_interface['bin-runtime']
abi = contract_interface['abi']
dummyContract = w3.eth.contract(abi=abi, bytecode=bytecode)
nonce = w3.eth.getTransactionCount(Web3.toChecksumAddress(address))+1
txn = dummyContract.constructor().buildTransaction({
    "chainId": 1337,
    "gasPrice": w3.eth.gas_price,
    "from": w3.eth.accounts[0],
    "nonce": nonce
})
