...
import "@chainlink/contracts/src/v0.8/dev/ChainlinkClient.sol";

contract ContractName is Ownable, ChainlinkClient {
    constructor() {
         setPublicChainlinkToken();
    }

    function requestData(
        address _oracle,
        bytes32 _jobId,
        string memory _endpoint,
        string memory _round,
        string memory _seasonId
    ) public {
        Chainlink.Request memory req =
            buildChainlinkRequest(_jobId, address(this), this.fulfill.selector);
        req.add(req, "endpoint", _endpoint);
        req.add(req, "round", _round);
        req.add(req, "season_id", _seasonId);

        sendChainlinkRequestTo(_oracle, req, fee_);
    }
