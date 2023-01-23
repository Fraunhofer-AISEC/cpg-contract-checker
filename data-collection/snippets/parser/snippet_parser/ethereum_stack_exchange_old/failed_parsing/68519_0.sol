  function createLotteryPot(
    string memory potName, uint duration, uint minStake,
    LotteryPot.PotType potType
  ) public payable returns(LotteryPot) {
    LotteryPot newContract = new LotteryPot({ _potName: potName,
      _duration: duration, _minStake: minStake, _potType: potType });
    ...
  }
