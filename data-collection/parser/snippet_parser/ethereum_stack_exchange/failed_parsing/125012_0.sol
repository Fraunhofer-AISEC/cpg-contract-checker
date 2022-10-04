def test_get_user_total_value_with_different_tokens(amount_staked, random_erc20):
    if network.show_active() not in LOCAL_BLOCKCHAIN_ENVIRONMENTS:
        pytest.skip("Only for local testing")
    account = get_account()
    token_farm, dapp_token = test_stake_tokens(amount_staked)
    # Act
    tx = token_farm.addAllowedTokens(random_erc20.address, {"from": account})
    tx.wait(1)
    # The random_erc20 is going to represent DAI
    # Since the other mocks auto deploy
    token_farm.setPriceFeedContract(
        random_erc20.address, get_contract("dai_usd_price_feed"), {"from": account}
    )
    random_erc20_stake_amount = amount_staked * 2
    random_erc20.approve(
        token_farm.address, random_erc20_stake_amount, {"from": account}
    )
    token_farm.stakeTokens(
        random_erc20_stake_amount, random_erc20.address, {"from": account}
    )
    # Act
    total_eth_balance = token_farm.getUserTotalValue(account.address)
    assert total_eth_balance == INITIAL_PRICE_FEED_VALUE * 3
