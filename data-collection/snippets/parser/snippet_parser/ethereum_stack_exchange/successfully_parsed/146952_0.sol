


pragma solidity 0.8.19;


import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";


contract RealEstateDataConsumer is ChainlinkClient {


    uint256 oraclePayment;
    uint256 public smartZipData;
    
    
    constructor(uint256 _oraclePayment) {
        
        setPublicChainlinkToken();
        oraclePayment = _oraclePayment;

    }


    function requestDataSmartZip(address _oracle, bytes32 _jobId, string memory _propertyId) public returns (bytes32 requestId) {
        
        Chainlink.Request memory req = buildChainlinkRequest(_jobId, address(this), this.fulfillSmartZip.selector);
        req.add("property_id", _propertyId);
        return sendChainlinkRequestTo(_oracle, req, oraclePayment);
        
    }

    function fulfillSmartZip(bytes32 _requestId, uint256 _data) public recordChainlinkFulfillment(_requestId) {
        
        smartZipData = _data;
        
    }


}
