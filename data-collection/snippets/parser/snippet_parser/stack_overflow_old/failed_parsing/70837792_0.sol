from brownie import FundMe, MockV3Aggregator, accounts, config, network
from scripts.helpful_scripts import get_account


def deploy_fund_me():
    account = get_account()
    # Passing Price Feed to our Solidity contract.

    # If we are on a persistent network like rinkeby, use its price feed address.
    # Otherwise use Mocks.
    # print(account)
    if network.show_active() != "development":
        price_feed_address = config["networks"][network.show_active()][
            "eth_usd_price_feed"
        ]
    else:
        print(f"The current Network is: {network.show_active()}")
        print("Deploying Mock....")
        mock_aggregator = MockV3Aggregator.deploy(
            18, 2000000000000000000, {"from": accounts}
        )
        price_feed_address = mock_aggregator.address
        print("Mock Deployed!!")

    fund_me = FundMe.deploy(
        price_feed_address,
        {"from": account},
        publish_source=True,
    )
    print(f"It is deployed to {fund_me.address}")


def main():
    deploy_fund_me()

