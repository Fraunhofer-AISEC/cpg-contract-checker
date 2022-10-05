

pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract Lottery is VRFConsumerBase {

    enum LOTTERY_STATE {
        OPEN,
        CLOSED,
        GET_WINNER
    }

    address private owner;
    address public winner;
    address payable[] public contestents;
    uint256 public fee;
    uint256 public usdEntryFee;
    bytes32 public requestID;
    bytes32 public keyHash;
    LOTTERY_STATE public ls;
    AggregatorV3Interface internal priceFeed;

    modifier onlyOwner() {
        _;
        require(msg.sender == owner, "You are not the owner!");
        _;
    }

    constructor(
        address _priceFeed,
        address _vrfCoordinator,
        address _link,
        uint256 _fee,
        bytes32 _keyHash
    ) public VRFConsumerBase(_vrfCoordinator, _link) {

        usdEntryFee = 50 * (10**18);
        priceFeed = AggregatorV3Interface(_priceFeed);
        ls = LOTTERY_STATE.CLOSED;
        fee = _fee;
        keyHash = _keyHash;
        owner = msg.sender;
    }

    function get_ethUsdPrice() private view returns (uint256) {
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        return uint256(answer);
    }

    function getEntranceFee() private view returns (uint256) {
        uint256 answer = get_ethUsdPrice();
        uint256 adjustedPrice = answer * (10**10);
        uint256 costToEnter = (usdEntryFee * (10**18)) / adjustedPrice;

        return costToEnter;
    }

    function startLottery() public onlyOwner {
        require(
            ls == LOTTERY_STATE.CLOSED,
            "Can't start another lottery before the previous one finishes!!"
        );
        ls = LOTTERY_STATE.OPEN;
    }

    function enterLottery() public payable {
        require(
            ls == LOTTERY_STATE.OPEN,
            "Lottery is unavailable/terminated. Try again later."
        );
        require(
            msg.value >= getEntranceFee(),
            "You need to send $50 Worth of eth!!"
        );
        contestents.push(msg.sender);
    }

    function endLottery() public onlyOwner {
        require(ls == LOTTERY_STATE.OPEN, "The lottery is yet to start!!");

        ls = LOTTERY_STATE.GET_WINNER;
        requestID = requestRandomness(keyHash, fee);
    }

    function fulfillRandomness(bytes32 _requestId, uint256 _randomness)
        internal
        override
    {
        require(_requestId == requestID, "The Request IDs Don't Match!");
        require(ls == LOTTERY_STATE.GET_WINNER, "Can't Procceed!!");
        require(_randomness > 0, "Random Not Found!!!");

        uint256 winnerAdd = _randomness % contestents.length;
        winner = contestents[winnerAdd];
        payable(winner).transfer(address(this).balance);

        contestents = new address payable[](0);
        ls = LOTTERY_STATE.CLOSED;
    }
}
