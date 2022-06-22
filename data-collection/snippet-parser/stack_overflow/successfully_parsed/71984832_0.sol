contract Lottery {
  
  struct LotChance {
    address payable userAddress;
    uint256 ids;
  }
  LotChance[] public lotChances;

  function getResult() public onlyOwner {
 
    luckyPerson.transfer(address(this).balance);
    lotteryId++;
    lotChances = new LotChance[](0);
  }
}

