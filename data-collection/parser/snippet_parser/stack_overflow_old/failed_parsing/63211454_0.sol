pragma solidity ^0.6.2;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/develop/evm-contracts/src/v0.6/VRFConsumerBase.sol";


contract Lottery is VRFConsumerBase, ChainlinkClient {
