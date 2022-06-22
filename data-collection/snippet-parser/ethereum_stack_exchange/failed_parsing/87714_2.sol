pragma solidity ^0.6.0;
import "./VRFConsumerBase.sol";
import "https://raw.githubusercontent.com/smartcontractkit/chainlink/develop/evm-contracts/src/v0.6/ChainlinkClient.sol";

contract DomainOffering is VRFConsumerBase, ChainlinkClient {
