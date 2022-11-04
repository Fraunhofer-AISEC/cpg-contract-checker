
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";

contract VRFCoordinatorTest_2 is  VRFConsumerBaseV2 {
    

    address vrfCoordinatorV2 = 0x2Ca8E0C643bDe4C2E08ab1fA0da3401AdAD7734D;
    uint64 subscriptionId = 443;
    bytes32 gasLane = 0x79d3d8832d904592c0bf9818b621522c988bb8b0c05cdc3b15aea1b6e8db0c15;
    uint32 public callbackGasLimit = 2500000; 

    uint256 public requestsFulfilled = 0; 

    
    VRFCoordinatorV2Interface private immutable _vrfCoordinator;

    
    uint16 public  REQUEST_CONFIRMATIONS = 3;

    
    struct RequestStatus {
        bool fulfilled; 
        bool exists; 
        uint256[] randomWords;
    }
   mapping(uint256 => RequestStatus) public s_requests;
   uint256[] public requestIds;
   


    event ReceivedRandomWords(uint256 requestId ,uint256[] randomWords);
    event RequestedRandomWords(uint256 requestId ,address requester);
    event AllRequestsFulfilled();

    constructor() VRFConsumerBaseV2(vrfCoordinatorV2) {
        _vrfCoordinator = VRFCoordinatorV2Interface(vrfCoordinatorV2);
    }

    function fulfillRandomWords(uint256 _requestId, uint256[] memory _randomWords) internal override{
        require(s_requests[_requestId].exists, 'request not found');
        require(!s_requests[_requestId].fulfilled, 'request already fulfilled');
        requestsFulfilled++;
        s_requests[_requestId].fulfilled = true;
        s_requests[_requestId].randomWords = _randomWords;
        emit ReceivedRandomWords(_requestId,_randomWords);
        if(requestsFulfilled==101){
          emit AllRequestsFulfilled();
        }
    }

    function requestRandomWords()public{
        uint32 numWords = 100;
        for(uint256 i=0;i<101;i++){
        if(i==100){
            numWords=1;
        }
        uint256 requestId = _vrfCoordinator.requestRandomWords(
        gasLane,
        subscriptionId,
        REQUEST_CONFIRMATIONS,
        callbackGasLimit,
        numWords
        );
        s_requests[requestId]=RequestStatus({randomWords: new uint256[](0), exists: true, fulfilled: false});
        requestIds.push(requestId);
        emit RequestedRandomWords(requestId, msg.sender);
            
        }
        
    }

    function getRequestStatus(uint256 requestId) external view returns (bool fulfilled, uint256[] memory randomWords) {
        require(s_requests[requestId].exists, 'request not found');
        RequestStatus memory request = s_requests[requestId];
        return (request.fulfilled, request.randomWords);
    }

    function getRandomWordsAt(uint256 requestId,uint32 index) external view returns (uint256) {
        require(s_requests[requestId].exists, 'request not found');
        RequestStatus memory request = s_requests[requestId];
        return  request.randomWords[index];
    }

    function getRequestIdsLength() external view returns (uint256){
        return requestIds.length;
    }

    function getRandomWords(uint256 requestId) external view returns (uint256[] memory){
        require(s_requests[requestId].exists, 'request not found');
            return s_requests[requestId].randomWords;
    }
 
}

