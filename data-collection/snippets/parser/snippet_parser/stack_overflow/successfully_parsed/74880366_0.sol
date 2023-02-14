
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract APIConsumer is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 public risk;
    bytes32 private jobId;
    uint256 private fee;
    string public a= "0x6e1db9836521977ee93651027768f7e0d5722a33";

    event RequestRisk(bytes32 indexed requestId, uint256 risk);

    

    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
        setChainlinkOracle(0xCC79157eb46F5624204f47AB42b3906cAA40eaB7);
        jobId = "ca98366cc7314957b8c012c72f05aeeb";
        fee = (1 * LINK_DIVISIBILITY) / 10; 
    }
    
    
    
    
    
    
    
    
    
    
    function requestRiskData() public returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        req.add("get","https://demo.anchainai.com/api/address_risk_score?proto=eth&address=0x6e1db9836521977ee93651027768f7e0d5722a33&apikey=demo_api_key");
        req.add("path", "data,0x6e1db9836521977ee93651027768f7e0d5722a33,risk,score");

        return sendChainlinkRequest(req, fee);
    }

    function fulfill(
        bytes32 _requestId,
        uint256 _risk
        
    ) public recordChainlinkFulfillment(_requestId) {
        emit RequestRisk(_requestId, _risk);
        risk = _risk;
    }

    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(
            link.transfer(msg.sender, link.balanceOf(address(this))),
            "Unable to transfer"
        );
    }
    function myStuff() public payable{
    requestRiskData();
        if(risk>2){
           
        }
    }

    }
