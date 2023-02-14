
pragma solidity ^0.8.16;

import '@chainlink/contracts/src/v0.8/ChainlinkClient.sol';
import '@chainlink/contracts/src/v0.8/ConfirmedOwner.sol';

contract ComparePrice is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    bytes32 private jobId;
    uint256 private fee;

    
    uint256 public btc;
    uint256 public eth;
    uint256 public ada;
    uint256 public sol;
    uint256 public dot;

    event RequestMultipleFulfilled(bytes32 indexed requestId, uint256 btc, uint256 eth, uint256 ada, uint256 sol, uint256 dot);

    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
        setChainlinkOracle(0xCC79157eb46F5624204f47AB42b3906cAA40eaB7);
        jobId = '53f9755920cd451a8fe46f5087468395';
        fee = (1 * LINK_DIVISIBILITY) / 10; 
    }

    
    function requestMultipleParameters() public {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillMultipleParameters.selector
        );

        req.add('urlBTC', 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,SOL,LINK,ADA,DOT&tsyms=EUR,EUR,EUR,EUR,EUR,EUR');
        req.add('pathBTC', 'BTC,EUR');
        req.add('urlETH', 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,SOL,LINK,ADA,DOT&tsyms=EUR,EUR,EUR,EUR,EUR,EUR');
        req.add('pathETH', 'ETH,EUR');
        req.add('urlADA', 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,SOL,LINK,ADA,DOT&tsyms=EUR,EUR,EUR,EUR,EUR,EUR');
        req.add('pathADA', 'ADA,EUR');
        req.add('urlSOL', 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,SOL,LINK,ADA,DOT&tsyms=EUR,EUR,EUR,EUR,EUR,EUR');
        req.add('pathSOL', 'SOL,EUR');
        req.add('urlDOT', 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,SOL,LINK,ADA,DOT&tsyms=EUR,EUR,EUR,EUR,EUR,EUR');
        req.add('pathDOT', 'DOT,EUR');

        sendChainlinkRequest(req, fee); 
    }

    
    function fulfillMultipleParameters(
        bytes32 requestId,
        uint256 btcResponse,
        uint256 ethResponse,
        uint256 adaResponse,
        uint256 solResponse,
        uint256 dotResponse

    ) public recordChainlinkFulfillment(requestId) {

        emit RequestMultipleFulfilled(requestId, btcResponse, ethResponse, adaResponse, solResponse, dotResponse);
        btc = btcResponse;
        eth = ethResponse;
        ada = adaResponse;
        sol = solResponse;
        dot = dotResponse;

    }

    
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(link.transfer(msg.sender, link.balanceOf(address(this))), 'Unable to transfer');
    }
}
