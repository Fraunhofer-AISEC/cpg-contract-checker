
pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract Lottery is VRFConsumerBase, Ownable {
    AggregatorV3Interface internal ethUsdPriceFeed;
    uint256 usdEntryFee;
    address[] public players;
    bytes32 internal keyHash; 
    uint256 internal fee;
    uint256 public randomness;

    enum LOTTERY_STATE {
        OPEN,
        CLOSED,
        CALCULATING_WINNER
    }
    LOTTERY_STATE public lottery_state;

    constructor(
        address _priceFeedAddress,
        address _VRFCoordinator, 
        address _link, 
        uint256 _fee,
        bytes32 _keyhash
    ) public VRFConsumerBase(_vrfCoordinator, _link) {
        usdEntryFee = 50 * (10**18);
        ethUsdPriceFeed = AggregatorV3Interface(_priceFeedAddress);
        lottery_state = CLOSED;
        fee = _fee;
        keyhash = _keyhash;
    }

    function enter() public payable {
        require(lottery_state == OPEN);
        
        require(msg.value >= getEntranceFee(), "Not enought ETH!");
        
        players.push(msg.sender);
    }

    function getEntranceFee() public view returns (uint256) {
        (, int256 price, , , ) = ethUsdPriceFeed.latestRoundData();
        uint256 adjustedPrice = uint256(price) * (10**10); 
        
        
        
        uint256 costToEnter = (usdEntryFee * 10**18) / adjustedPrice; 
        return costToEnter;
    }

    function startLottery() public {
        require(lottery_state == CLOSED, "Can't start a new lottery yet");
        lottery_state = LOTTERY_STATE.OPEN;
    }

    function endLottery() public {
        lottery_state = LOTTERY_STATE.CLOSED;
        require(
            LINK.balanceOf(address(this)) >= fee,
            "Not enough LINK - fill contract with faucet"
        );
        bytes32 requestId = requestRandomness(keyHash, fee); 
    }

    function fulfillRandomness(bytes32 _requestId, uint256 _randomness)
        internal
        override
    {
        require(
            lottery_state == LOTTERY_STATE.CALCULATING_WINNER,
            "You are n't there yet !"
        );
        require(_randomness > 0, "radnom-not-found !");
        uint256 indexOfWinner = _radonmness % players.length; 
        recentWinner = players[indexOfWinner];
        rencentWinner.tranfer(address(this).balance);

        

        players = new address payable[](0);
        lottery_state = LOTTERY_STATE.CLOSED;
        randomness = _randomness;
    }
}
