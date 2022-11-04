

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "./Timecontrolled.sol";

contract CallWithdraw is ChainlinkClient, TimeControlled {
    using Chainlink for Chainlink.Request;
    address public linkToken;
    uint256 public oraclePayment;
    address public oracle;
    bytes32 public jobId;
    uint256 public fundingPeriod = 5;

    constructor(
        address _linkToken,
        uint256 _oraclepayment,
        address _oracle,
        bytes32 _jobId
    ) public TimeControlled(true) {
        owner == msg.sender;
        oraclePayment = _oraclepayment;
        linkToken = _linkToken;
        oracle = _oracle;
        jobId = _jobId;
    }

    function callWithdraw() external {
        
        
        require(address(this).balance > 0);
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfill.selector
        );
        req.addUint("until", block.timestamp + fundingPeriod * 1 minutes);
        withdraw();
        sendChainlinkRequestTo(oracle, req, oraclePayment);
    }

    function fulfill(bytes32 _requestId)
        public
        recordChainlinkFulfillment(_requestId)
    {
        address(this).balance == 0;
    }
}
