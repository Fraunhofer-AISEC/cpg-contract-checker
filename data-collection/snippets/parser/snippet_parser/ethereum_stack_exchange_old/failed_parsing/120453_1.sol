from brownie import (
    network, config, Contract,
    TransparentUpgradeableProxy, ProxyAdmin,
)
import eth_utils


NON_FORKED_LOCAL_BLOCKCHAIN_ENVIRONMENTS = ["hardhat", "development", "ganache"]
LOCAL_BLOCKCHAIN_ENVIRONMENTS = NON_FORKED_LOCAL_BLOCKCHAIN_ENVIRONMENTS + [
    "mainnet-fork",
]


def encode_function_data(initializer=None, *args):
    """
    Encodes the function call so we can work with an initializer.

    Args:
        initializer ([brownie.network.contract.ContractTx], optional):
        The initializer function we want to call. Example: 'box.store'.
        Defaults to None.

        args (Any, optional):
        The arguments to pass to the initializer function.

    Returns:
        [bytes]: Return the encoded bytes.
    """
    if len(args) == 0 or not initializer:
        return eth_utils.to_bytes(hexstr="0x") # to return at least some bytes;
    return initializer.encode_input(*args)


def upgrade(
    account,
    proxy,
    new_implementation_address,
    proxy_admin_contract=None,
    initializer=None,
    *args
    ):
    """
    Update our proxy contract:

    Args:
        account (string, address): the caller account private key
        proxy (string, contract): the proxy contract to be updated
        new_implementation_address (string, address): the address of implementation contract (the new one)
        proxy_admin_contract (string, contract, optional): if admin contract exists
        initializer (string, optional): if initializer exists (to be encoded)
        *args (Any, optional): if *args exists (parameter to be encoded with initializer)
    """
    transaction = None
    if proxy_admin_contract:
        if initializer:
            # encode initiliazer in bytes
            encoded_function_call = encode_function_data(initializer, *args)
            # upgrade the proxy admin contract with encoded initializer
            transaction = proxy_admin_contract.upgradeAndCall(
                proxy.address,
                new_implementation_address,
                encoded_function_call,
                {"from": account},
            )
        else:
            # upgrade the proxy admin contract WITHOUT encoded initializer
            transaction = proxy_admin_contract.upgrade(
                proxy.address,
                new_implementation_address,
                {"from": account},
            )
    else:
    # if proxy admin does not exists
        if initializer:
            # encode initiliazer in bytes
            encoded_function_call = encode_function_data(initializer, *args)
            transaction = proxy.upgradeToAndCall(
                new_implementation_address,
                encoded_function_call,
                {"from": account},
            )
        else:
            transaction == proxy.upgradeTo(
                new_implementation_address,
                {"from": account},
            )
    return transaction


def deploy_proxy(account, contract_deployed, contract_name="contract", initilizer=None, *args):
    # 1.create proxy admin
    proxy_admin = ProxyAdmin.deploy(
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("publish", False)
        )
    # 2.encode initiazer
    if initilizer:
        encoded_initiliazer = encode_function_data(initilizer, *args)
    else:
        encoded_initiliazer = encode_function_data()
    # 3.create proxy
    proxy = TransparentUpgradeableProxy.deploy(
        contract_deployed.address,
        proxy_admin.address,
        encoded_initiliazer,
        {"from": account, "gas_limit": 1000000},
        publish_source=config["networks"][network.show_active()].get("publish", False)
    )
    # 4. create proxy contract
    proxy_contract = Contract.from_abi(
        contract_name, proxy.address, contract_deployed.abi
    )
    return proxy_admin, proxy_contract, proxy
