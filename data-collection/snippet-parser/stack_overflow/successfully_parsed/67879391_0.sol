pragma solidity ^0.6.0;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/master/evm-contracts/src/v0.6/ChainlinkClient.sol";

contract APIConsumer is ChainlinkClient {
  
    uint256 public uniPrice;
    uint256 public uniSupply;
    
 
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    
    constructor() public {
        setPublicChainlinkToken();
        oracle = 0x2f90A6D021db21e1B2A077c5a37B3C7E75D15b7e;
        jobId = "29fa9aa13bf1468788b7cc4a500a45b8";
        fee = 0.1 * 10 ** 18; 
    }



    function requestUniPrice() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillUniPrice.selector);

        request.add("get", "https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&ids=uniswap%2C%20sushi%2C%20pancakeswap-token&order=market_cap_desc&per_page=100&page=1&sparkline=false");
        
        request.add("path","0.current_price");

        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
    function requestUniSupply() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillUniSupply.selector);

        request.add("get", "https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&ids=uniswap%2C%20sushi%2C%20pancakeswap-token&order=market_cap_desc&per_page=100&page=1&sparkline=false");
        
        request.add("path","0.circulating_supply");

        return sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfillUniPrice(bytes32 _requestId, uint256 _uniPrice) public recordChainlinkFulfillment(_requestId)
    {
        uniPrice = _uniPrice;
    }
    
    function fulfillUniSupply(bytes32 _requestId, uint256 _uniSupply) public recordChainlinkFulfillment(_requestId)
    {
        uniSupply = _uniSupply;
    }

    function withdrawLink() external {
        LinkTokenInterface linkToken = LinkTokenInterface(chainlinkTokenAddress());
        require(linkToken.transfer(msg.sender, linkToken.balanceOf(address(this))), "Unable to transfer");
    }
}