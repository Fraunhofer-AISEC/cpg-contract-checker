
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;
  
    bytes32 public api_data;
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
}