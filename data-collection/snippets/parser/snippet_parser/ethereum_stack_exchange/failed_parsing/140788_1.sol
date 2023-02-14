## RandomNumber.sol

function requestRandomWords() internal returns (uint256 requestID) {
        uint256 price = VRF_V2_WRAPPER.calculateRequestPrice(callbackGasLimit);
        uint256 linkToGet;
        if (price - s_linkBalance < 0) {
            linkToGet = 0;
        } else {
            linkToGet = price - s_linkBalance;
        }
        convertEthToLink(linkToGet);
        if (s_linkBalance < price) revert RandomNumber__insufficientFunds();
        return requestRandomness(callbackGasLimit, 1, 1);
    }
