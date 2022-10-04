import os


def deploy_simple_storage():

    # load from you set encrypted , not from ganache-cli which is brownie automated connceted to
    # account = accounts.load("MG515-account")
    # print(account)

    # add private key use enviroment variables
    # account = accounts.add(os.getenv("PRIVATE_KEY"))
    # print(account)

    # .deploy() , always need a "from"key in a dictinary when making a transaction
    account = accounts.add(config["wallets"]["from_key"])
    simple_storage = SimpleStorage.deploy({"from": account})
    stored_value = simple_storage.retrieve()
    print("Current stored value is ：")
    print(stored_value)
    print("Updating Contract...")
    transaction = simple_storage.store(15, {"from": account})
    transaction.wait(1)
    updated_store_value = simple_storage.retrieve()
    print("Current stored value is ：")
    print(updated_store_value)


def main():
    deploy_simple_storage()

