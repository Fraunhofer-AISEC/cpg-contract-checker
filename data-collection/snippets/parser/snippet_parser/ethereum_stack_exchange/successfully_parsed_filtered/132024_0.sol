import '@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol';
import '@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol';

contract ULotto is VRFConsumerBaseV2{

VRFCoordinatorV2Interface COORDINATOR;

    
    uint64 s_subscriptionId; 
    address vrfCoordinator = 0x2eD832Ba664535e5886b75D64C46EB9a228C2610;
    bytes32 s_keyHash = 0x354d2f95da55398f44b7cff77da56283d9c6c829a4bdf1bbcaf2ad6a4d081f61;
    uint32 callbackGasLimit = 2000000;
    uint16 requestConfirmations = 3;
    uint32 numWords = 6;
    uint256[] public s_results;

constructor(uint64 subscriptionId) VRFConsumerBaseV2(vrfCoordinator){
        owner = msg.sender;
        lotteryIdCounter = 1;

        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        s_subscriptionId = subscriptionId;
    }

function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override {
        s_results = randomWords;
    }

    function drawNumbers() public onlyOwner returns (uint256 requestId){
        

        requestId = COORDINATOR.requestRandomWords(
            s_keyHash,
            s_subscriptionId,
            requestConfirmations, 
            callbackGasLimit,
            numWords
        );

    }

}
