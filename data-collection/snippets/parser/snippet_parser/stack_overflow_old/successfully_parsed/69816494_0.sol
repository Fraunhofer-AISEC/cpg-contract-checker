contract ValorantCards is Ownable, ERC1155, VRFConsumerBase, ChainlinkClient {
using Chainlink for Chainlink.Request;

address private linkToken;


bytes32 private keyHash;
uint256 private vrfFee;

uint256 public randomResult;


address private oracle;
bytes32 private jobId;
uint256 private oracleFee;

uint256 public playerLevel;

constructor(
    address _vrfCoordinator,
    address _linkToken,
    bytes32 _keyHash,
    address _oracle,
    bytes32 _jobId,
    uint256 _oracleFee
) ERC1155("") VRFConsumerBase(_vrfCoordinator, _linkToken) {
    setPublicChainlinkToken();

    linkToken = _linkToken;
    keyHash = _keyHash;
    vrfFee = 0.1 * 10**18;

    oracle = _oracle;
    jobId = _jobId;
    oracleFee = _oracleFee;
}

function requestUserLevel() public returns (bytes32 requestId) {
    Chainlink.Request memory request = buildChainlinkRequest(
        jobId,
        address(this),
        this.fulfill.selector
    );

    request.add(
        "get",
        "https://api.henrikdev.xyz/valorant/v1/account/draven/2023"
    );
    request.add("path", "data.account_level");

    return sendChainlinkRequestTo(oracle, request, oracleFee);
}

function fulfill(bytes32 _requestId, uint256 _level)
    public
    recordChainlinkFulfillment(_requestId)
{
    playerLevel = _level;
}
}