
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract ExternalAPIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    uint256 public allInSystem;
    uint256 public isProject;
    uint256 public senderAuthority;
    uint256 public receiverAuthority;

    address private oracle;
    bytes32 private jobId;
    uint256 private fee;

    event requestFulfilled(
        uint256 isProject,
        uint256 senderAuthority,
        uint256 allInSystem,
        uint256 receiverAuthority
    );

    constructor(address _oracle) {
        setPublicChainlinkToken();
        oracle = _oracle;
        jobId = "0b0e0c3944a94c989515e2dd81087356";
        fee = 0.1 * 10**18; 
    }

    
    function requestValidationData(
        string memory _jwtToken,
        string memory _jobId
    ) public {
        jobId = stringToBytes32(_jobId);
        Chainlink.Request memory request = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfill.selector
        );
        request.add("orgAddress", "2021-11-02");
        request.add("senderAddress", "12111");
        request.add("receiverAddress", "FL");
        request.add("jwtToken", _jwtToken);
        sendChainlinkRequestTo(oracle, request, fee);
    }

    
    function fulfill(
        bytes32 _requestId,
        uint256 _allInSystem,
        uint256 _isProject,
        uint256 _senderAuthority,
        uint256 _receiverAuthority
    ) public recordChainlinkFulfillment(_requestId) {
        allInSystem = _allInSystem;
        isProject = _isProject;
        senderAuthority = _senderAuthority;
        receiverAuthority = _receiverAuthority;
        emit requestFulfilled(
            isProject,
            senderAuthority,
            allInSystem,
            receiverAuthority
        );
    }

    function stringToBytes32(string memory source)
        public
        pure
        returns (bytes32 result)
    {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }
}
