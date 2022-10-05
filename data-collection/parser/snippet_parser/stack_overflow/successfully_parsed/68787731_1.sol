

pragma solidity ^0.6.6;

import "@chainlink/contracts/src/v0.6/ChainlinkClient.sol";

contract APIConsumer is ChainlinkClient {


uint256 public volume;

address private oracle;
bytes32 private jobId;
uint256 private fee;


constructor(address _oracle, string memory _jobId, uint256 _fee, address _link) public {
    if (_link == address(0)) {
        setPublicChainlinkToken();
    } else {
        setChainlinkToken(_link);
    }
    
    
    
    oracle = _oracle;
    jobId = stringToBytes32(_jobId);
    fee = _fee;
}


function requestVolumeData() public returns (bytes32 requestId) 
{
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
    
    
    request.add("get", "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD");
    
    
    
    
    
    
    
    
    
    
    
    request.add("path", "RAW.ETH.USD.VOLUME24HOUR");
    
    
    int timesAmount = 10**18;
    request.addInt("times", timesAmount);
    
    
    return sendChainlinkRequestTo(oracle, request, fee);
}

 
function fulfill(bytes32 _requestId, uint256 _volume) public recordChainlinkFulfillment(_requestId)
{
    volume = _volume;
}

function stringToBytes32(string memory source) public pure returns (bytes32 result) {
    bytes memory tempEmptyStringTest = bytes(source);
    if (tempEmptyStringTest.length == 0) {
        return 0x0;
    }

    assembly {
        result := mload(add(source, 32))
    }
}
}
