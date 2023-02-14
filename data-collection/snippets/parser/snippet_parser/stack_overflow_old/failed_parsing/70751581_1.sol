from brownie import FundMe, network, config, MockV3Aggregator
from scripts.helpful_scripts import (
    get_account,
    deploy_mocks,
    LOCAL_BLOCKCHAIN_ENVIRONMENT,
)


def deploy_fund_me():
    account = get_account()
    # if we have a persistent network like rinkeby,use the associated address
    # otherwise ,deploy mocks
    if network.show_active() not in LOCAL_BLOCKCHAIN_ENVIRONMENT:
        price_feed_address = config["networks"][network.show_active()][
            "eth_usd_price_feed"
        ]
    else:
        deploy_mocks()
        # just use the latest mockV3Aggregator
        price_feed_address = MockV3Aggregator[-1].address
        print("***********************************************************")
        print(f"MockVeAggrator's address is {price_feed_address}")

    fund_me = FundMe.deploy(
        price_feed_address,
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("verify"),
    )
    print("***********************************************************")
    print(f"The Ether price is :{fund_me.getPrice()}\n")
    print(f"Contract deployed to {fund_me.address}\n")
    entrance_fee = fund_me.getEntranceFee()
    print("***********************************************************")
    print(f"The entrance fee is : {entrance_fee} !\n")
    return fund_me


def main():
    deploy_fund_me()
