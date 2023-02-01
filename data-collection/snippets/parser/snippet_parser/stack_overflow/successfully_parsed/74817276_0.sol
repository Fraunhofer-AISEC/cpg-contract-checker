

pragma solidity 0.8.9;
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract AccuweatherConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;
    
    struct RequestParams {
        uint256 locationKey;
        string endpoint;
        string lat;
        string lon;
        string units;
    }
    struct LocationResult {
        uint256 locationKey;
        string name;
        bytes2 countryCode;
    }

    
    mapping(bytes32 => LocationResult) public requestIdLocationResult;
    mapping(bytes32 => RequestParams) public requestIdRequestParams;
    
    
    constructor(address _link, address _oracle) {
        setChainlinkToken(_link);
        setChainlinkOracle(_oracle);
    }
    
    
    function requestLocation(
        bytes32 _specId,
        uint256 _payment,
        string calldata _lat,
        string calldata _lon
    ) public {
        Chainlink.Request memory req = buildChainlinkRequest(_specId, address(this), this.fulfillLocation.selector);
        req.add("endpoint", "location"); 
        req.add("lat", _lat);
        req.add("lon", _lon);
        bytes32 requestId = sendChainlinkRequest(req, _payment);
        
        storeRequestParams(requestId, 0, "location", _lat, _lon, "");
    }

    
    
    function fulfillLocation(
        bytes32 _requestId,
        bool _locationFound,
        bytes memory _locationResult
    ) public recordChainlinkFulfillment(_requestId) {
        if (_locationFound) {
            storeLocationResult(_requestId, _locationResult);
        }
    }

    
    function storeRequestParams(
        bytes32 _requestId,
        uint256 _locationKey,
        string memory _endpoint,
        string memory _lat,
        string memory _lon,
        string memory _units
    ) private {
        RequestParams memory requestParams;
        requestParams.locationKey = _locationKey;
        requestParams.endpoint = _endpoint;
        requestParams.lat = _lat;
        requestParams.lon = _lon;
        requestParams.units = _units;
        requestIdRequestParams[_requestId] = requestParams;
    }
    function storeLocationResult(bytes32 _requestId, bytes memory _locationResult) private {
        LocationResult memory result = abi.decode(_locationResult, (LocationResult));
        requestIdLocationResult[_requestId] = result;
    }
}
