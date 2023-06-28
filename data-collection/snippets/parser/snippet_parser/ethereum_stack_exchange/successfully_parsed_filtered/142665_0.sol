








pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/interfaces/KeeperCompatibleInterface.sol";

error Raffle__NotEnoughETHEntered();
error Raffle__TransferFailed();
error Raffle__NotOpen();
error Raffle_UpkeepNotNeeded(uint256 currentBalance, uint256 numPlayers, uint256 raffleState);



contract Raffle is VRFConsumerBaseV2, KeeperCompatibleInterface {
   
   enum RaffleState {
       OPEN,
       CALCULATING
   } 

   
   uint256 private immutable i_entranceFee;
   address payable[] private s_players;
   VRFCoordinatorV2Interface private immutable i_vrfCoordinator;
   bytes32 private immutable i_gasLane;
   uint64 private immutable i_subscriptionId;
   uint16 private constant REQUEST_CONFIRMATIONS = 3;
   uint16 private immutable i_callbackGasLimit;
   uint32 private constant NUM_WORDS = 1;

   
   address private s_recentWinner;
   RaffleState private s_raffleState; 
   uint256 private s_lastTimeStamp;
   uint256 private immutable i_interval;

   
   event RaffleEnter(address indexed player);
   event RequestedRaffleWinner(uint256 indexed requestId);
   event WinnerPicked(address indexed winner);

   constructor(
       address vrfCoordinatorV2, 
       uint256 entranceFee,
       bytes32 gasLane,
       uint64 subscriptionId,
       uint16 callbackGasLimit,
       uint256 interval
   ) VRFConsumerBaseV2(vrfCoordinatorV2) {
       i_vrfCoordinator = VRFCoordinatorV2Interface(vrfCoordinatorV2);
       i_entranceFee = entranceFee;
       i_gasLane = gasLane;
       i_subscriptionId = subscriptionId;
       i_callbackGasLimit = callbackGasLimit;
       s_raffleState = RaffleState.OPEN;
       s_lastTimeStamp = block.timestamp;
       i_interval = interval;
   }

   
   function enterRaffle() public payable {
       
       if (msg.value < i_entranceFee) {
           revert Raffle__NotEnoughETHEntered();
       }
       if (s_raffleState != RaffleState.OPEN) {
           revert Raffle__NotOpen();
       }
       s_players.push(payable(msg.sender));
       
       
       emit RaffleEnter(msg.sender);
   }

   

   function checkUpkeep(
       bytes memory 
   ) public override returns (bool upKeepNeeded, bytes memory ) {
       bool isOpen = (RaffleState.OPEN == s_raffleState);
       bool timePassed = ((block.timestamp - s_lastTimeStamp) > i_interval);
       bool hasPlayers = (s_players.length > 0);
       bool hasBalance = address(this).balance > 0;
       upKeepNeeded = (isOpen && timePassed && hasPlayers && hasBalance);
       
   }

   function performUpkeep(bytes calldata ) external override {
       
       
       
       (bool upkeepNeeded, ) = checkUpkeep("");
       if (!upkeepNeeded) {
           revert Raffle_UpkeepNotNeeded(
               address(this).balance,
               s_players.length,
               uint256(s_raffleState)
           );
       }
       s_raffleState = RaffleState.CALCULATING;
       uint256 requestId = i_vrfCoordinator.requestRandomWords(
           i_gasLane, 
           i_subscriptionId,
           i_callbackGasLimit,
           REQUEST_CONFIRMATIONS,
           NUM_WORDS
       );
       emit RequestedRaffleWinner(requestId);
   }

   function fulfillRandomWords(
       uint256 ,
       uint256[] memory randomWords
   ) internal override {
       uint256 indexOfWinner = randomWords[0] % s_players.length;
       address payable recentWinner = s_players[indexOfWinner];
       s_recentWinner = recentWinner;
       s_raffleState = RaffleState.OPEN;
       s_players = new address payable[](0);
       s_lastTimeStamp = block.timestamp;
       (bool success, ) = recentWinner.call{value: address(this).balance}("");
       if (!success) {
           revert Raffle__TransferFailed();
       }
       emit WinnerPicked(recentWinner);
   }

   
   function getEntranceFee() public view returns (uint256) {
       return i_entranceFee;
   }

   function getPlayer(uint256 index) public view returns (address) {
       return s_players[index];
   }

   function getRecentWinner() public view returns (address) {
       return s_recentWinner;
   }

   function getRaffleState() public view returns (RaffleState) {
       return s_raffleState;
   }

   function getNumWords() public pure returns (uint256) {
       return NUM_WORDS;
   }

   function getNumberOfPlayers() public view returns (uint256) {
       return s_players.length;
   }

   function getLatestTimeStamp() public view returns (uint256) {
       return s_lastTimeStamp;
   }

   function getRequestConfirmations() public pure returns (uint256) {
       return REQUEST_CONFIRMATIONS;
   }

   function getInterval() public view returns (uint256) {
       return i_interval;
   }
}
