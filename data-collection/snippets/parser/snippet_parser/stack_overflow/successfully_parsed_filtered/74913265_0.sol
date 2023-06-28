    
pragma solidity ^0.8.9;


import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract RealEstateBonus is ChainlinkClient, Ownable {
    using Chainlink for Chainlink.Request;

    bytes32 private jobId;
    uint256 private fee;
    string public url;
    string public urlresult;
    string public lastselldate;
    string public lastapn;
    bytes32 public lastrequestid;

    event RequestMultipleFulfilled(bytes32 indexed requestId, string selldate, string apn);

    constructor() {
        setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
        setChainlinkOracle(0xCC79157eb46F5624204f47AB42b3906cAA40eaB7);
        jobId = "53f9755920cd451a8fe46f5087468395";
        fee = (1 * LINK_DIVISIBILITY) / 10; 
        url="https://api.bridgedataoutput.com/api/v2/pub/transactions?access_token=d555ec24e3f182c86561b09d0a85c3dc&limit=1&sortBy=recordingDate&order=desc&fields=recordingDate,parcels.apn&recordingDate.gt=2015-01-01&parcels.apn=";
        
    }
    
    struct Bonus {
        string parcelid;
        address seller;
        address realtor;
        uint256 amount;
        uint startdate;
        uint sellbydays;
    }
    
    mapping (string => Bonus) public parcelbonus;
    mapping (string => string) public parcellastselldate;
    
    function createBonus (string memory _parcelid, address _realtor, uint _sellbydays) public payable {
        parcelbonus[_parcelid]=Bonus(_parcelid, msg.sender,_realtor, msg.value, block.timestamp, _sellbydays);
    }
    
    function createBonusTest (string memory _parcelid, address _realtor, uint _startdate, uint _sellbydays) public payable {
        parcelbonus[_parcelid]=Bonus(_parcelid, msg.sender,_realtor, msg.value, _startdate, _sellbydays);
    
    }
    
    function realtorwithdraw (string memory parcelid) public {}
    
    function sellerwithdraw (string memory parcelid) public {}
    
    function formurl (string memory _parcelid) public {
        
        urlresult=string(abi.encodePacked(url,_parcelid));
        
        
    }
    
    function requestSellData(string memory _parcelid) public returns (bytes32 requestId) {
        formurl(_parcelid);
        Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfillMultipleParameters.selector);
        
        req.add("urlRECD", urlresult);
        req.add("pathRECD", "bundle,0,recordingDate");
        req.add("urlAPN", urlresult);
        req.add("pathAPN", "bundle,0,parcels,0,apn");  
        
        return sendChainlinkRequest(req, fee);
    }

    function fulfillMultipleParameters(
        bytes32 _requestId,
        string memory _selldate,
        string memory _apn
    ) public recordChainlinkFulfillment(_requestId) {
        emit RequestMultipleFulfilled(_requestId, _selldate, _apn);
        lastrequestid = _requestId;
        lastselldate = _selldate;
        lastapn = _apn;
        parcellastselldate[_apn] = _selldate;
    }
    
    
}
