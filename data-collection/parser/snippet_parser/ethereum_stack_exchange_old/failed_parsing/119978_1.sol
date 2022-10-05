from brownie import SimpleContract, accounts
import time

def main():
  account = accounts[index]
  simpleContract = SimpleContract.deploy({'from': account})

  now = int(time.time())
  validFor = 20 # valid for 20 seconds
  simpleContract.doSomething(now + validFor, {'from': account})
