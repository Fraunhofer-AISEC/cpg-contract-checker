from brownie import Donation, config, network, MockV3Aggregator

from scripts.helpful_scripts import (
    LOCAL_BLOCKCHAIN_ENVIRONMENTS,
    deploy_mocks,
    get_account,
)


def deploy_donation():
    account = get_account()

    if network.show_active() not in LOCAL_BLOCKCHAIN_ENVIRONMENTS:
        price_feed_address = config["networks"][network.show_active()][
            "eth_usd_price_feed_address"
        ]
    else:
        deploy_mocks()
        price_feed_address = MockV3Aggregator[-1].address
    donation = Donation.deploy(
        price_feed_address,
        {"from": account},
    )
    print(f"Contract deployed to {donation.address}")
    get_price = donation.getPrice()
    print(f"The current price of ETH/USD is {get_price}")
    get_conversion_rate = donation.getConversionRate(100)
    print(get_conversion_rate)
    return donation


def main():
    deploy_donation()
