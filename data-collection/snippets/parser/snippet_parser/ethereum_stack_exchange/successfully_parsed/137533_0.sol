import "@openzeppelin/contracts/utils/Counters.sol";

pragma solidity ^0.8.15;


contract Example  {
  using Counters for Counters.Counter;
  Counters.Counter  public tokenId;
    constructor () {
      tokenId.increment();
    }

}
