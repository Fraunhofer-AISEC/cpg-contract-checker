def swap_pancake():
    account = get_account()
    simple_storage = BabyDoge.deploy(
        "0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526", {"from": account})  # Deploying contract - First address is for AgreggatorV3PriceFeed
    amount = Web3.toWei(0.1, "ether")
    # Path to smartcontract calling that function
    path = simple_storage.getPathForWBNBtoDAI()
    pancakeRouter = interface.IPancakeRouter01(  # IPancakeRouter01 Interface with pancake router address
        config["networks"][network.show_active()]["pancake_address"])
    # Pancake router address RAW
    pancakeRouterv2 = "0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3"
    wbnbAddress = interface.IPancakeRouter01(
        config["networks"][network.show_active()]["wbnb_token"])  # IPancakeRouter01 address with WBNB Token

    # Approving Pancake Router Address with amount
    approve_pancake(pancakeRouterv2, amount)
    transFrom = wbnbAddress.transferFrom(
        account, pancakeRouterv2, amountIn, {"from": account, "gas": 805000, "allow_revert": True})  # Testing transFrom in case was needed
    swap_tx = pancakeRouter.swapExactTokensForTokens(
        amountIn, amountOutMin, path, account, deadline, {"from": account})

    print(f"Line txt{swap_tx}")
