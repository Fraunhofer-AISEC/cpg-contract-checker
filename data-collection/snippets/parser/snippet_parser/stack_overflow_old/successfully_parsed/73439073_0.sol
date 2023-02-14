
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";

contract VRFCoordinatorTest is  VRFConsumerBaseV2 {
    

    address vrfCoordinatorV2 = 0x6168499c0cFfCaCD319c818142124B7A15E857ab;
    uint64 subscriptionId = 14422;
    bytes32 gasLane = 0xd89b2bf150e3b9e13446986e571fb9cab24b13cea0a43ea20a6049a85cc807cc;
    uint32 public callbackGasLimit = 2500000; 

    
    VRFCoordinatorV2Interface private immutable _vrfCoordinator;

    
    uint16 public  REQUEST_CONFIRMATIONS = 10;

    
    uint32 public NUM_WORDS = 500;

    
   uint256[][] public _randomWords = new uint256[][](0);
   


    event RequestedRandomWords(uint256 requestId ,address requester);

    constructor() VRFConsumerBaseV2(vrfCoordinatorV2) {
        _vrfCoordinator = VRFCoordinatorV2Interface(vrfCoordinatorV2);
    }

    function fulfillRandomWords(uint256, uint256[] memory randomWords) internal override{
        _randomWords.push(randomWords);
       
    }

    function requestRandomWords()public{
        uint256 requestId = _vrfCoordinator.requestRandomWords(
            gasLane,
            subscriptionId,
            REQUEST_CONFIRMATIONS,
            callbackGasLimit,
            NUM_WORDS
        );
        emit RequestedRandomWords(requestId, msg.sender);
    }

    function set_REQUEST_CONFIRMATIONS(uint16 comf)public{
        REQUEST_CONFIRMATIONS = comf;
    }
    function set_NUM_WORDS(uint32 num)public{
        NUM_WORDS = num;
    }
    function set_gasLimit(uint32 gasl) public{
        callbackGasLimit = gasl;
    }

    function getMaxLengthAndNum()public view returns(uint256,uint256){
        uint256 lth = _randomWords.length;
        uint256[] memory tmpArray = _randomWords[lth-1];
        uint256 lastNum = tmpArray[tmpArray.length-1];
        

        return (lth,lastNum);
    }
}
