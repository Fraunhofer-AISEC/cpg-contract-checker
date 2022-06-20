contract_to_mock = {
"eth_usd_price_feed": MockV3Aggregator,
"vrf_coordinator": VRFCoordinatorMock
}

def get_contract(contract_name):
"""This function will grab the contract addresses from the brownie config if
defined, otherwise it will deploy a mock version of that contract and return that
mock contract.

    args:
        contract_name (string)

    Returns:
        brownie.network.contract.ProjectContract: The most recently deployed 
        version of this contract.

"""
contract_type = contract_to_mock(contract_name)
if network.show_active() in LOCAL_BLOCKCHAIN_ENVIRONMENTS:  # if local network deploy mock
    if len(contract_type) <= 0: # MockV3Agg.length
        deploy_mocks()
    contract = contract_type[-1]
else:
    contract_address = config["networks"][network.show_active()][contract_name]  # otherwise get address and abi of deployed contract
    # address and ABI
    contract = Contract.from_abi(contract_type.name, contract_address, contract_type.abi)
return contract
