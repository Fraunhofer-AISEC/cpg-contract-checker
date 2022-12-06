function completeChallenge(address _challengerAddress,address _challengeAddress,uint _index) internal returns(bool) {
   _challengerAddress.transfer(safeMul(challengeList[_challengerAddress][_challengeAddress][_index].challengeChargeAmountWei,2));
   return true;
}
