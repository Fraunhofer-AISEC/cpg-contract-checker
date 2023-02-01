    from brownie import AdvancedCollectible, accounts, config
from scripts.helpful_scripts import get_raffle, fund_with_link
import time

STATIC_SEED = 1234


def main():
    dev = accounts.add(config["wallets"]["from_key"])
    advanced_collectible = AdvancedCollectible[len(AdvancedCollectible) - 1]
    fund_with_link(advanced_collectible.address)
    transaction = advanced_collectible.createCollectible(
        STATIC_SEED, "None", {"from": dev}
    )
    print("Waiting on second transaction...")
    # wait for the 2nd transaction
    transaction.wait(1)
    # time.sleep(35)
    requestId = transaction.events["RequestedCollectible"]["requestId"]
    token_id = advanced_collectible.requestIdToTokenId(requestId)
    raffle = get_raffle(advanced_collectible.tokenIdToRaffle(token_id))
    print("Houses of tokenId {} is {}".format(token_id, raffle))
