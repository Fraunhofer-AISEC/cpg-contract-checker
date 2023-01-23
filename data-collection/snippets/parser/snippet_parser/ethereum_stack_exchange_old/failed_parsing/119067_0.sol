# from brownie import FundMe, accounts, config
from brownie import FundMe, accounts
import yaml
import json
from scripts.helpful_scripts import get_account


# here everything within the env file (for environment variables) is loaded into the python file


def deploy_fund_me():
    account = get_account()
    fund_me = FundMe.deploy({"from": account}, publish_source=True)
    print("Contract deployed to {fund_me.address}")


def main():
    deploy_fund_me()
