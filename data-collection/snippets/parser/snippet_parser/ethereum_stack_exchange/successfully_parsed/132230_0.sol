    
pragma solidity 0.8.13;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";


contract NFTBankConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    mapping(bytes32 => uint256) public requestIdPrice;
    mapping(bytes32 => DateAndPrice) public requestIdDateAndPrice;

    struct DateAndPrice {
        uint128 date;
        uint128 price;
    }

    error FailedTransferLINK(address to, uint256 amount);

    

    
    constructor(address _link, address _oracle) {
        setChainlinkToken(_link);
        setChainlinkOracle(_oracle);
    }

    

    function cancelRequest(
        bytes32 _requestId,
        uint256 _payment,
        bytes4 _callbackFunctionId,
        uint256 _expiration
    ) external {
        cancelChainlinkRequest(_requestId, _payment, _callbackFunctionId, _expiration);
    }

    
    function fulfillPrice(bytes32 _requestId, uint256 _estimate) external recordChainlinkFulfillment(_requestId) {
        requestIdPrice[_requestId] = _estimate;
    }

    function fulfillDateAndPrice(bytes32 _requestId, bytes32 _result) external recordChainlinkFulfillment(_requestId) {
        requestIdDateAndPrice[_requestId] = getDateAndPrice(_result);
    }

    
    function getEstimate(
        bytes32 _specId,
        uint256 _payment,
        address _assetAddress,
        uint256 _tokenId,
        string calldata _pricingAsset
    ) external {
        Chainlink.Request memory req = buildOperatorRequest(_specId, this.fulfillPrice.selector);

        req.addBytes("assetAddress", abi.encodePacked(_assetAddress));
        req.addUint("tokenId", _tokenId);
        req.add("pricingAsset", _pricingAsset);

        sendOperatorRequest(req, _payment);
    }

    
    function getFloorPrice(
        bytes32 _specId,
        uint256 _payment,
        address _assetAddress,
        string calldata _pricingAsset
    ) external {
        Chainlink.Request memory req = buildOperatorRequest(_specId, this.fulfillPrice.selector);

        req.addBytes("assetAddress", abi.encodePacked(_assetAddress));
        req.add("pricingAsset", _pricingAsset);

        sendOperatorRequest(req, _payment);
    }

    
    function getDateAndFloorPrice(
        bytes32 _specId,
        uint256 _payment,
        address _assetAddress,
        string calldata _pricingAsset
    ) external {
        Chainlink.Request memory req = buildOperatorRequest(_specId, this.fulfillDateAndPrice.selector);

        req.addBytes("assetAddress", abi.encodePacked(_assetAddress));
        req.add("pricingAsset", _pricingAsset);

        sendOperatorRequest(req, _payment);
    }

    function setOracle(address _oracle) external {
        setChainlinkOracle(_oracle);
    }

    function withdrawLink(uint256 _amount, address payable _payee) external {
        LinkTokenInterface linkToken = LinkTokenInterface(chainlinkTokenAddress());
        _requireTransferLINK(linkToken.transfer(_payee, _amount), _payee, _amount);
    }

    

    function getOracleAddress() external view returns (address) {
        return chainlinkOracleAddress();
    }

    

    function getDateAndPrice(bytes32 _data) private pure returns (DateAndPrice memory) {
        DateAndPrice memory dateAndPrice = DateAndPrice(uint128(bytes16(_data)), uint128(bytes16(_data << 128)));
        return dateAndPrice;
    }

    function _requireTransferLINK(
        bool _success,
        address _to,
        uint256 _amount
    ) private pure {
        if (!_success) {
            revert FailedTransferLINK(_to, _amount);
        }
    }
}
