    account = get_account()
    # pass the price feed address to our fundme contract's constructor
    # if we are on Rinkeby Network, use said address
    if network.show_active() not in LOCAL_BLOCKCHAIN_ENVIRONMENTS:
        price_feed_address = config["networks"][network.show_active()][
            "eth_usd_price_feed"
        ]
    else:
        deploy_mocks()
        price_feed_address = MockV3Aggregator[-1].address  # gets the latest address

    fund_me = FundMe.deploy(
        "0x8A753747A1Fa494EC906cE90E9f37563A8AF630e", # this should be price_feed_address
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("verify"),
    )
    print(f"Contract deployed to {fund_me.address}")
