uint256 private immutable i_entranceFee;

**VRFCoordinatorV2** private immutable i_vrfCoordinator;

bytes32 private immutable i_gasLane;

uint64 private immutable i_subscriptionId;

uint16 private constant REQUEST_CONFIRMATIONS = 3;

uint32 private immutable i_callbackGasLimit;

uint32 private constant NUM_WORDS = 1;



address private s_recentWinner;

event RaffleEnter(address indexed player);

event RequestedRaffleWinner(uint256 indexed requestId);

event WinnerPicked(address indexed winner);

constructor(
    address VRFCoordinatorV2,
    uint256 entranceFee,
    bytes32 gasLane,
    uint64 subscriptionId,
    uint32 callbackGasLimit
) VRFConsumerBaseV2(VRFCoordinatorV2) {
    i_entranceFee = entranceFee;
    i_vrfCoordinator = VRFCoordinatorV2Interface(VRFCoordinatorV2);
    i_gasLane = gasLane;
    i_subscriptionId = subscriptionId;
    i_callbackGasLimit = callbackGasLimit;
}

function enterRaffle() public {
    if (msg.value < i_entranceFee) {
        revert Raffle__notEnoughETHEntered();
    }

    s_players.push(payable(msg.sender));
    emit RaffleEnter(msg.sender);
}

function requestRandomWinner() external {
    uint256 requestId = i_vrfCoordinator.requestRandomWords(
        i_gasLane,
        i_subscriptionId,
        REQUEST_CONFIRMATIONS,
        i_callbackGasLimit,
        NUM_WORDS
    );

    emit RequestedRaffleWinner(requestId);
}

function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override {
    uint256 indexOfWinner = randomWords[0] % s_players.length;
    address payable recentWinner = s_players[indexOfWinner];
    s_recentWinner = recentWinner;
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
