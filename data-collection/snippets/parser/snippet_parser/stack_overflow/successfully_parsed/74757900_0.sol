
pragma solidity ^0.8.17;

import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/VRFConsumerBase.sol";

contract Random is VRFConsumerBase {
    bytes32 internal immutable keyHash;
    uint256 internal immutable fee;
    uint256 public immutable ticketPrice;

    uint256 public result;
    address payable[] public ticketOwners;

    constructor (
        address _ChainlinkVRFCoordinator,
        address _ChainlinkLINKToken,
        bytes32 _ChainlinkKeyHash,
        uint256 _ticketPrice
    ) VRFConsumerBase (
        _ChainlinkVRFCoordinator,
        _ChainlinkLINKToken
    ) {
        keyHash = _ChainlinkKeyHash;
        fee = 0.1 * 10 ** 18;
        ticketPrice = _ticketPrice;
    }

    function enterRaffle() public payable {
        require(msg.value >= ticketPrice, "Invalid ticket price");
        ticketOwners.push(payable(msg.sender));
    }

    function getRandomNumber() public returns (bytes32 requestId) {
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
        return requestRandomness(keyHash, fee);
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        result = randomness;
    }
}
