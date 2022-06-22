pragma solidity ^0.6.0;

import "github.com/smartcontractkit/chainlink/evm-contracts/src/v0.6/dev/AggregatorInterface.sol";

contract ReferenceConsumer {
  AggregatorInterface internal ref;


  constructor(address _aggregator) public {
    ref = AggregatorInterface(_aggregator);
  }

  function getLatestAnswer() public view returns (int256) {
    return ref.latestAnswer();
  }

  function getLatestTimestamp() public view returns (uint256) {
    return ref.latestTimestamp();
  }
}