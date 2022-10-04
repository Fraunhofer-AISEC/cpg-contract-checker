

pragma solidity ^0.8.7;

import "node_modules/@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "node_modules/@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "node_modules/@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

contract Lottery is VRFConsumerBaseV2 {
    VRFCoordinatorV2Interface COORDINATOR;

    address owner;
    address[] buyers = [msg.sender];
    address winner;
    address vrfCoordinator = 0x2Ca8E0C643bDe4C2E08ab1fA0da3401AdAD7734D;

    bytes32 keyHash;

    uint32 callbackGasLimit = 5000000;
    uint16 requestConfirmations = 3;
    uint32 numWords = 1;
    uint256[] public randomWords;
    uint256 public requestId;
    uint64 subscriptionId;
    uint256 usdEntryFee;
    uint256 startingTime;
    uint256 endTime;
    uint256 prizePool;
    bool available;

    AggregatorV3Interface public priceFeed;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function enterLottery() public payable returns (bool success) {
        buyers.push(msg.sender);
    }

    function getEntranceFee() public view returns (uint256) {
        (, int256 price, , , ) = priceFeed.latestRoundData();
        uint256 adjustedPrice = uint256(price) * 10**10; 
        
        
        
        uint256 costToEnter = (usdEntryFee * 10**18) / adjustedPrice;
        return costToEnter;
    }

    constructor(address _priceFeed, uint64 _subscriptionId)
        VRFConsumerBaseV2(vrfCoordinator)
    {
        priceFeed = AggregatorV3Interface(_priceFeed);
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        owner = msg.sender;
        usdEntryFee = 50 * (10**18);
        subscriptionId = _subscriptionId;
    }

    function requestRandomWords() public onlyOwner {
        requestId = COORDINATOR.requestRandomWords(
            keyHash,
            subscriptionId,
            requestConfirmations,
            callbackGasLimit,
            numWords
        );
    }

    function addSubscription() public {
        COORDINATOR.addConsumer(subscriptionId, address(this));
    }

    function fulfillRandomWords(
        uint256, 
        uint256[] memory _randomWords
    ) internal override {
        randomWords = _randomWords;
    }

    function startLottery(uint256 _endTime) public onlyOwner {
        startingTime = block.timestamp;
        available = true;
        endTime = startingTime + _endTime;
    }

    function endLottery() public payable onlyOwner returns (uint256) {
        require(
            block.timestamp > endTime,
            "Auction ending date not arrived yet!"
        );
        available = false;
        uint256 randomIndex;
        requestRandomWords();
        randomIndex = randomWords[0] % buyers.length;
        winner = buyers[randomIndex];
        return (randomWords[0]);
    }

    function transferWinnings() public payable onlyOwner {
        if (!payable(winner).send(prizePool)) {
            revert("Transaction failed!");
        }
    }
}

