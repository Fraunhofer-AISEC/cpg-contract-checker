CONTRACT_SOURCE = """
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract SimpleStorage{
    
    uint256 storeData;
    
    function setData(uint256 x) public{
        storeData = x;
    }
    
    function getData() public view returns(uint256){
        return storeData;
    }
}
"""
# compile solidity source code
compile_sol = compile_source(
    CONTRACT_SOURCE,
    output_values=["abi", "bin"],
    # solc_version="0.7.0"
)
# print(compile_sol)
# create an interface for compile contract
smartcontract_interface = compile_sol['<stdin>:SimpleStorage']
# print(smartcontract_interface)

simple_storage = WEB3.eth.contract(
    abi=smartcontract_interface["abi"],
    bytecode=smartcontract_interface["bin"]
)

# send ether from which accout ?
WEB3.eth.defaultAccount = WEB3.eth.accounts[0]

# Submit the transaction that deploys the contract
tx_hash = simple_storage.constructor().transact()

# Wait for the transaction to be mined, and get the transaction receipt
tx_receipt = WEB3.eth.wait_for_transaction_receipt(tx_hash)

ASSETREGISTER = WEB3.eth.contract(
    # get the transaction from transaction address
    address=tx_receipt.contractAddress,
    abi=smartcontract_interface["abi"]
)
