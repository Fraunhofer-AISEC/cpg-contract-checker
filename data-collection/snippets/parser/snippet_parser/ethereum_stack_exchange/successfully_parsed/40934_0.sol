  bytes4 methodId = bytes4(keccak256("rewardBB(uint5,string)"));
  require(_service.call(methodId, 100, "some string of params."));
