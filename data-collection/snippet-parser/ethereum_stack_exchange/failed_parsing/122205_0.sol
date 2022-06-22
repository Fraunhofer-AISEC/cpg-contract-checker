from brownie import FundMe 
from scripts.helpful_scripts import get_account 
    
#the erro is on this file, I've testing in other file and it worked normally
    
def fund():  
  fund_me = FundMe[-1]  
  account = get_account()
  entrance_fee = fund_me.getEntranceFee()
    
def main():
  fund()
