contract VRFv2DirectFundingConsumer is VRFV2WrapperConsumerBase, Initializable {
    ...

    address public constant linkAddress = 0x779877A7B0D9E8603169DdbD7836e478b4624789;
    address public constant linkWrapper = 0xab18414CD93297B0d12ac29E63Ca20f515b3DB46;

    
    constructor() VRFV2WrapperConsumerBase(linkAddress, linkWrapper) {
        _disableInitializers();
    }

    function initialize() public payable initializer { 
        admin = msg.sender;
    }

    
    function requestRandomWords() internal returns (uint256 requestId) {
        requestId = requestRandomness(
            callbackGasLimit,
            requestConfirmations,
            numWords
        );

        return requestId;
    }

