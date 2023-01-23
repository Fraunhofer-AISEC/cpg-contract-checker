

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/KeeperCompatible.sol";

error Raffle__SendMoreToEnterRaffle();
error Raffle__RaffleIsNotOpen();
error Raffle__TransferFailed();
error Raffle__UpkeepNotNeeded(uint256 currentBalance, uint256 numPlayers, uint256 raffleState);

contract Raffle is VRFConsumerBaseV2, KeeperCompatibleInterface {
   
    enum RaffleState {
        Open,
        Calculating
    }
    
    uint256 private immutable i_enteranceFee;
    address payable[] private s_players;
    address private s_recentWinner;
    uint256 private s_lastTimeStamp;
    uint256 private immutable i_interval;
    RaffleState private s_raffleState;

    
    VRFCoordinatorV2Interface private immutable i_vrfCoordinator;
    bytes32 private immutable i_gasLane;
    uint64 private immutable i_subscriptionId;
    uint16 private constant REQUEST_CONFIRMATION = 3;
    uint32 private immutable i_callbackGasLimit;
    uint32 private constant NUM_WORDS = 1;

  
    event RaffleEnter(address indexed player);
    event RequestRafflewinner(uint256 indexed requestId);
    event WinnerPicked(address indexed winner);

    constructor(
        address vrfCoordinatorV2,
        uint64 subscriptionId,
        uint256 enteranceFee,
        bytes32 gasLane,
        uint32 callbackGasLimit,
        uint256 interval
    ) VRFConsumerBaseV2(vrfCoordinatorV2) {
        i_vrfCoordinator = VRFCoordinatorV2Interface(vrfCoordinatorV2);
        i_subscriptionId = subscriptionId;
        i_enteranceFee = enteranceFee;
        i_gasLane = gasLane;
        i_callbackGasLimit = callbackGasLimit;
        i_interval = interval;
        s_raffleState = RaffleState.Open;
        s_lastTimeStamp = block.timestamp;
    }

    
    function enterRaffle() public payable {
        if (msg.value < i_enteranceFee) {
            revert Raffle__SendMoreToEnterRaffle();
        }
        
        if (s_raffleState != RaffleState.Open) {
            revert Raffle__RaffleIsNotOpen();
        }
        s_players.push(payable(msg.sender));

       
        emit RaffleEnter(msg.sender);
    }

    
    function checkUpkeep(
        bytes memory 
    )
        public
        view
        override
        returns (
            bool upkeepNeeded,
            bytes memory 
        )
    {
        bool isOpen = (RaffleState.Open == s_raffleState);
        bool timePassed = ((block.timestamp - s_lastTimeStamp) > i_interval);
        bool hasPlayers = (s_players.length > 0);
        bool hasBalance = (address(this).balance > 0);
        upkeepNeeded = (isOpen && timePassed && hasPlayers && hasBalance);
        return (upkeepNeeded, "");
    }

    
    function performUpkeep(
        bytes calldata 
    ) external override {
        (bool upkeepNeeded, ) = checkUpkeep("");

        if (!upkeepNeeded) {
            revert Raffle__UpkeepNotNeeded(
                address(this).balance,
                s_players.length,
                uint256(s_raffleState)
            );
        }
        s_raffleState = RaffleState.Calculating;
        uint256 requestId = i_vrfCoordinator.requestRandomWords(
            i_gasLane,
            i_subscriptionId,
            REQUEST_CONFIRMATION,
            i_callbackGasLimit,
            NUM_WORDS
        );
        emit RequestRafflewinner(requestId);
    }

    function fulfillRandomWords(
        uint256, 
        uint256[] memory randomWords
    ) internal override {
        
        uint256 indexOfWinner = randomWords[0] % s_players.length;
        address payable recentWinner = s_players[indexOfWinner];
        s_recentWinner = recentWinner;
        s_players = new address payable[](0);
        s_raffleState = RaffleState.Open;
        s_lastTimeStamp = block.timestamp;
       
        (bool success, ) = recentWinner.call{value: address(this).balance}("");
        if (!success) {
            revert Raffle__TransferFailed();
        }
        emit WinnerPicked(recentWinner);
    }

    
}
