from brownie import accounts
def check_balance:
    if network.show_active() not in ["development", "ganache"]:
        pytest.skip("run local testing")
    # assuming in local environent
    account=accounts[0]
    # you should have deploy script which deploys the contract and returns the contract
    your_contract=deploy_token_script()
    assert(
        # make an assertion
        your_token.balanceOf(account.address)>0
    )
