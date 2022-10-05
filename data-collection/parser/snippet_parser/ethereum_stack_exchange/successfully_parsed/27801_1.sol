function completeChallenge(address _challengerAddress,address _challengeAddress,uint _index) internal returns(bool) {
    uint transferAmount = safeMul(challengeList[_challengerAddress][_challengeAddress][_index].challengeChargeAmountWei, 2);
   _challengerAddress.transfer(transferAmount);
   return true;
}
