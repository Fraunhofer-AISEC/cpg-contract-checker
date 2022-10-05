from brownie import (
    Contract,
    network,
    config,
    accounts,
    MockV3Aggregator,
    VRFCoordinatorMock,
    LinkToken,
)


FORKED_LOCAL_ENVIRONMENTS = ["mainnet-fork"]
LOCAL_BLOCKCHAIN_ENVIRONMENTS = ["development", "ganache-local"]


DECIMALS = 8
STARTING_PRICE = 200000000000


def get_accounts(index=None, id=None):
    if index:
        return accounts[index]
    if id:
        return accounts.load(id)
    if (
        network.show_active() in LOCAL_BLOCKCHAIN_ENVIRONMENTS
        or network.show_active() in FORKED_LOCAL_ENVIRONMENTS
    ):
        return accounts[0]

    return accounts.add(config["wallets"]["from_key"])


contract_to_mock = {
    "eth_usd_price_feed": MockV3Aggregator,
    "v3_aggregator": VRFCoordinatorMock,
    "link_token": LinkToken,
}


def get_contract(contract_name):
    """
    This function will grab the contract addresses from the brownie
    config if defined, otherwise it will deploy a mock version of
    that contract and return that mock contract.

        Args:
            contract_name (string)
        Returns:
            brownie.network.contract.projectContract: The most recently
            deployed version of this contract.
            MockV3Aggregator[-1]

    """

    contract_type = contract_to_mock[contract_name]
    if network.show_active() in LOCAL_BLOCKCHAIN_ENVIRONMENTS:
        if len(contract_type <= 0):
            deploy_mocks()
        contract = contract_type[-1]
    else:
        contract_address = config["networks"][network.show_active()][contract_name]
        # address
        # ABI
        contract = Contract.from_abi(
            contract_type._name, contract_address, contract_type.abi
        )
        return contract


def deploy_mocks():
    account = get_accounts()
    MockV3Aggregator.deploy(DECIMALS, STARTING_PRICE, {"from": account})
    link_token = LinkToken.deploy({"from": account})
    VRFCoordinatorMock.deploy(link_token.address, {"from": account})
    print("Mocks deployed...")
