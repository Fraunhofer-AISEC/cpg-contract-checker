contract Loterya is Ownable {

uint256[] public numbers;
uint256[] public randomWords;
uint256 public requestId;    

function finishLoterya () public {
    requestId = getRandomWords(5); 
    getFinalNumbers(requestId);
}

function getRandomWords (uint32 _numWords) internal returns (uint256) {
    return randomNumberOracle.requestRandomWords(_numWords);
}

function getFinalNumbers (uint256 _requestId) internal {
    (, randomWords) = randomNumberOracle.getRequestStatus(_requestId);
}

}
