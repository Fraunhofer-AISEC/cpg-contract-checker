contract Whoopy is Initializable, VRFConsumerBaseV2, KeeperCompatible {

function initialize(address _whoopyCreator) public initializer {

    VRFConsumerBaseV2.initialise(vrfCoordinatorV2);
    i_vrfCoordinator = VRFCoordinatorV2Interface(vrfCoordinatorV2);
    s_raffleState = RaffleState.CLOSED;
    s_lastTimeStamp = block.timestamp;
    whoopyCreator = _whoopyCreator;

    i_vrfCoordinator.addConsumer(subscriptionId, address(this));
    emit NewConsumerAdded(address(this)); 
}
}