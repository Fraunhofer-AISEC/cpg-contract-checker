from brownie import FundMe
from scripts.helpful_scripts import get_account





def fund():
    fund_me = FundMe[-1]

    account = get_account()

    entrance_fee = fund_me.getEntranceFee()
    print(f"The entrance fee is : {entrance_fee} !")
    print("funding")
    fund_me.fund({"from": account, "value": entrance_fee})
    print(f"Funded {entrance_fee} !")


def withdraw():
    fund_me = FundMe[-1]
    account = get_account()
    fund_me.withdraw({"from": account})


def main():
    fund()
    withdraw()

