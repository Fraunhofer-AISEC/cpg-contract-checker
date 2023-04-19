import "./VRFSetup.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
contract RandomNumber is VRFSetup, VRFConsumerBaseV2 {
    uint32 _callbackGasLimit = 2500000;
    uint16 _requestConfirmations = 3;
    uint32 _numWords = 3;
    uint256 public _requestid;
    uint256[] public _randoms;

    constructor() VRFConsumerBaseV2(_coordinator) {}

    function requestRandomWords() external onlyOwner {
        
        _requestid = COORDINATOR.requestRandomWords(
            _keyHash,
            _subscriptionid,
            _requestConfirmations,
            _callbackGasLimit,
            _numWords
        );
    }

    function fulfillRandomWords(
        uint256 ,
        uint256[] memory randomWords
    ) internal override {
        _randoms = randomWords;
    }
}
