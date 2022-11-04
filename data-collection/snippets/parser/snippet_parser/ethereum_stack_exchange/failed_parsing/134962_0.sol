*
pragma solidity ^0.8.7;
import '@chainlink/contracts/src/v0.8/ChainlinkClient.sol';
import '@chainlink/contracts/src/v0.8/ConfirmedOwner.sol';
contract MultiWordConsumer is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;
    bytes32 private jobId;
    uint256 private fee;
    
    uint256 public region0;
    uint256 public region1;
    uint256 public region2;
    uint256 public region3;
    uint256 public region4;
    uint256 public region5;
    uint256 public region6;
    uint256 public region7;
    uint256 public region8;
    uint256 public region9;
    uint256 public region10;
    event RequestMultipleFulfilled(bytes32 indexed requestId, uint256 region0, uint256 region1, uint256 region2, uint256 region3, uint256 region4, uint256 region5, uint256 region6, uint256 region7, uint256 region8, uint256 region9, uint256 region10);
    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x01BE23585060835E02B77ef475b0Cc51aA1e0709);
        setChainlinkOracle(0xf3FBB7f3391F62C8fe53f89B41dFC8159EE9653f);
        jobId = '53f9755920cd451a8fe46f5087468395';
        fee = (1 * LINK_DIVISIBILITY) / 10; 
    }
    
    function requestMultipleParameters() public {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillMultipleParameters.selector
        );
        req.add('urlREGION0', 'https://www.speedrun.com/api/v1/leaderboards/w6j74qe6/category/824qp83k');
        req.add('pathREGION0', 'data, runs[0], system, region');
        req.add('urlREGION1', 'https://www.speedrun.com/api/v1/leaderboards/w6j74qe6/category/824qp83k');
        req.add('pathREGION1', 'data, runs[1], system, region');
        req.add('urlREGION2', 'https://www.speedrun.com/api/v1/leaderboards/w6j74qe6/category/824qp83k');
        req.add('pathREGION2', 'data, runs[2], system, region');
        req.add('urlREGION3', 'https://www.speedrun.com/api/v1/leaderboards/w6j74qe6/category/824qp83k');
        req.add('pathREGION3', 'data, runs[3], system, region');
        req.add('urlREGION4', 'https://www.speedrun.com/api/v1/leaderboards/w6j74qe6/category/824qp83k');
        req.add('pathREGION4', 'data, runs[4], system, region');
        req.add('urlREGION5', 'https://www.speedrun.com/api/v1/leaderboards/w6j74qe6/category/824qp83k');
        req.add('pathREGION5', 'data, runs[5], system, region');
        req.add('urlREGION6', 'https://www.speedrun.com/api/v1/leaderboards/w6j74qe6/category/824qp83k');
        req.add('pathREGION6', 'data, runs[6], system, region');
        req.add('urlREGION7', 'https://www.speedrun.com/api/v1/leaderboards/w6j74qe6/category/824qp83k');
        req.add('pathREGION7', 'data, runs[7], system, region');
        req.add('urlREGION8', 'https://www.speedrun.com/api/v1/leaderboards/w6j74qe6/category/824qp83k');
        req.add('pathREGION8', 'data, runs[8], system, region');
        req.add('urlREGION9', 'https://www.speedrun.com/api/v1/leaderboards/w6j74qe6/category/824qp83k');
        req.add('pathREGION9', 'data, runs[9], system, region');
        req.add('urlREGION10', 'https://www.speedrun.com/api/v1/leaderboards/w6j74qe6/category/824qp83k');
        req.add('pathREGION10', 'data, runs[10], system, region');
        sendChainlinkRequest(req, fee); 
    }
    
    function fulfillMultipleParameters(
        bytes32 requestId,
        uint256 region0Response,
        uint256 region1Response,
        uint256 region2Response,
        uint256 region3Response,
        uint256 region4Response,
        uint256 region5Response,
        uint256 region6Response,
        uint256 region7Response,
        uint256 region8Response,
        uint256 region9Response,
        uint256 region10Response
    ) public recordChainlinkFulfillment(requestId) {
        emit RequestMultipleFulfilled(requestId, region0Response, region1Response, region2Response, region3Response, region4Response, region5Response, region6Response, region7Response, region8Response, region9Response, region10Response);
        region0 = region0Response;
        region1 = region1Response;
        region2 = region2Response;
        region3 = region3Response;
        region4 = region4Response;
        region5 = region5Response;
        region6 = region6Response;
        region7 = region7Response;
        region8 = region8Response;
        region9 = region9Response;
        region10 = region10Response;
    }
    
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(link.transfer(msg.sender, link.balanceOf(address(this))), 'Unable to transfer');
    }
}*
