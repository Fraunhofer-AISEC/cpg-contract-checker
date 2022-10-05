pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../../../extensions/utils/FundDeployerOwnerMixin.sol";
import "../../../interfaces/IChainlinkAggregator.sol";
import "./IPrimitivePriceFeed.sol";




contract ChainlinkPriceFeed is IPrimitivePriceFeed, FundDeployerOwnerMixin {
    using SafeMath for uint256;

    event EthUsdAggregatorSet(address prevEthUsdAggregator, address nextEthUsdAggregator);

    event PrimitiveAdded(
        address indexed primitive,
        address aggregator,
        RateAsset rateAsset,
        uint256 unit
    );

    event PrimitiveRemoved(address indexed primitive);

    event PrimitiveUpdated(
        address indexed primitive,
        address prevAggregator,
        address nextAggregator
    );

    event StalePrimitiveRemoved(address indexed primitive);

    event StaleRateThresholdSet(uint256 prevStaleRateThreshold, uint256 nextStaleRateThreshold);

    enum RateAsset {ETH, USD}

    struct AggregatorInfo {
        address aggregator;
        RateAsset rateAsset;
    }

    uint256 private constant ETH_UNIT = 10**18;
    address private immutable WETH_TOKEN;

    address private ethUsdAggregator;
    uint256 private staleRateThreshold;
    mapping(address => AggregatorInfo) private primitiveToAggregatorInfo;
    mapping(address => uint256) private primitiveToUnit;

    constructor(
        address _fundDeployer,
        address _wethToken,
        address _ethUsdAggregator,
        address[] memory _primitives,
        address[] memory _aggregators,
        RateAsset[] memory _rateAssets
    ) public FundDeployerOwnerMixin(_fundDeployer) {
        WETH_TOKEN = _wethToken;
        staleRateThreshold = 25 hours; 
        __setEthUsdAggregator(_ethUsdAggregator);
        if (_primitives.length > 0) {
            __addPrimitives(_primitives, _aggregators, _rateAssets);
        }
    }

    

    
    
    
    
    
    
    function calcCanonicalValue(
        address _baseAsset,
        uint256 _baseAssetAmount,
        address _quoteAsset
    ) public view override returns (uint256 quoteAssetAmount_, bool isValid_) {
        

        int256 baseAssetRate = __getLatestRateData(_baseAsset);
        if (baseAssetRate <= 0) {
            return (0, false);
        }

        int256 quoteAssetRate = __getLatestRateData(_quoteAsset);
        if (quoteAssetRate <= 0) {
            return (0, false);
        }

        (quoteAssetAmount_, isValid_) = __calcConversionAmount(
            _baseAsset,
            _baseAssetAmount,
            uint256(baseAssetRate),
            _quoteAsset,
            uint256(quoteAssetRate)
        );

        return (quoteAssetAmount_, isValid_);
    }

    
    
    
    
    
    
    
    function calcLiveValue(
        address _baseAsset,
        uint256 _baseAssetAmount,
        address _quoteAsset
    ) external view override returns (uint256 quoteAssetAmount_, bool isValid_) {
        return calcCanonicalValue(_baseAsset, _baseAssetAmount, _quoteAsset);
    }

    
    
    
    function isSupportedAsset(address _asset) external view override returns (bool isSupported_) {
        return _asset == WETH_TOKEN || primitiveToAggregatorInfo[_asset].aggregator != address(0);
    }

    
    
    function setEthUsdAggregator(address _nextEthUsdAggregator) external onlyFundDeployerOwner {
        __setEthUsdAggregator(_nextEthUsdAggregator);
    }

    

    
    function __calcConversionAmount(
        address _baseAsset,
        uint256 _baseAssetAmount,
        uint256 _baseAssetRate,
        address _quoteAsset,
        uint256 _quoteAssetRate
    ) private view returns (uint256 quoteAssetAmount_, bool isValid_) {
        RateAsset baseAssetRateAsset = getRateAssetForPrimitive(_baseAsset);
        RateAsset quoteAssetRateAsset = getRateAssetForPrimitive(_quoteAsset);
        uint256 baseAssetUnit = getUnitForPrimitive(_baseAsset);
        uint256 quoteAssetUnit = getUnitForPrimitive(_quoteAsset);

        
        if (baseAssetRateAsset == quoteAssetRateAsset) {
            return (
                __calcConversionAmountSameRateAsset(
                    _baseAssetAmount,
                    baseAssetUnit,
                    _baseAssetRate,
                    quoteAssetUnit,
                    _quoteAssetRate
                ),
                true
            );
        }

        int256 ethPerUsdRate = IChainlinkAggregator(ethUsdAggregator).latestAnswer();
        if (ethPerUsdRate <= 0) {
            return (0, false);
        }

        
        if (baseAssetRateAsset == RateAsset.ETH) {
            return (
                __calcConversionAmountEthRateAssetToUsdRateAsset(
                    _baseAssetAmount,
                    baseAssetUnit,
                    _baseAssetRate,
                    quoteAssetUnit,
                    _quoteAssetRate,
                    uint256(ethPerUsdRate)
                ),
                true
            );
        }

        
        return (
            __calcConversionAmountUsdRateAssetToEthRateAsset(
                _baseAssetAmount,
                baseAssetUnit,
                _baseAssetRate,
                quoteAssetUnit,
                _quoteAssetRate,
                uint256(ethPerUsdRate)
            ),
            true
        );
    }

    
    function __calcConversionAmountEthRateAssetToUsdRateAsset(
        uint256 _baseAssetAmount,
        uint256 _baseAssetUnit,
        uint256 _baseAssetRate,
        uint256 _quoteAssetUnit,
        uint256 _quoteAssetRate,
        uint256 _ethPerUsdRate
    ) private pure returns (uint256 quoteAssetAmount_) {
        
        
        uint256 intermediateStep = _baseAssetAmount.mul(_baseAssetRate).mul(_ethPerUsdRate).div(
            ETH_UNIT
        );

        return intermediateStep.mul(_quoteAssetUnit).div(_baseAssetUnit).div(_quoteAssetRate);
    }

    
    function __calcConversionAmountSameRateAsset(
        uint256 _baseAssetAmount,
        uint256 _baseAssetUnit,
        uint256 _baseAssetRate,
        uint256 _quoteAssetUnit,
        uint256 _quoteAssetRate
    ) private pure returns (uint256 quoteAssetAmount_) {
        
        return
            _baseAssetAmount.mul(_baseAssetRate).mul(_quoteAssetUnit).div(
                _baseAssetUnit.mul(_quoteAssetRate)
            );
    }

    
    function __calcConversionAmountUsdRateAssetToEthRateAsset(
        uint256 _baseAssetAmount,
        uint256 _baseAssetUnit,
        uint256 _baseAssetRate,
        uint256 _quoteAssetUnit,
        uint256 _quoteAssetRate,
        uint256 _ethPerUsdRate
    ) private pure returns (uint256 quoteAssetAmount_) {
        
        
        uint256 intermediateStep = _baseAssetAmount.mul(_baseAssetRate).mul(_quoteAssetUnit).div(
            _ethPerUsdRate
        );

        return intermediateStep.mul(ETH_UNIT).div(_baseAssetUnit).div(_quoteAssetRate);
    }

    
    function __getLatestRateData(address _primitive) private view returns (int256 rate_) {
        if (_primitive == WETH_TOKEN) {
            return int256(ETH_UNIT);
        }

        address aggregator = primitiveToAggregatorInfo[_primitive].aggregator;
        require(aggregator != address(0), "__getLatestRateData: Primitive does not exist");

        return IChainlinkAggregator(aggregator).latestAnswer();
    }

    
    function __setEthUsdAggregator(address _nextEthUsdAggregator) private {
        address prevEthUsdAggregator = ethUsdAggregator;
        require(
            _nextEthUsdAggregator != prevEthUsdAggregator,
            "__setEthUsdAggregator: Value already set"
        );

        __validateAggregator(_nextEthUsdAggregator);

        ethUsdAggregator = _nextEthUsdAggregator;

        emit EthUsdAggregatorSet(prevEthUsdAggregator, _nextEthUsdAggregator);
        
    }

    
    
    

    
    
    
    
    function addPrimitives(
        address[] calldata _primitives,
        address[] calldata _aggregators,
        RateAsset[] calldata _rateAssets
    ) external onlyFundDeployerOwner {
        require(_primitives.length > 0, "addPrimitives: _primitives cannot be empty");

        __addPrimitives(_primitives, _aggregators, _rateAssets);
    }

    
    
    function removePrimitives(address[] calldata _primitives) external onlyFundDeployerOwner {
        require(_primitives.length > 0, "removePrimitives: _primitives cannot be empty");

        for (uint256 i; i < _primitives.length; i++) {
            require(
                primitiveToAggregatorInfo[_primitives[i]].aggregator != address(0),
                "removePrimitives: Primitive not yet added"
            );

            delete primitiveToAggregatorInfo[_primitives[i]];
            delete primitiveToUnit[_primitives[i]];

            emit PrimitiveRemoved(_primitives[i]);
        }
    }

    
    
    
    function removeStalePrimitives(address[] calldata _primitives) external {
        require(_primitives.length > 0, "removeStalePrimitives: _primitives cannot be empty");

        for (uint256 i; i < _primitives.length; i++) {
            address aggregatorAddress = primitiveToAggregatorInfo[_primitives[i]].aggregator;
            require(aggregatorAddress != address(0), "removeStalePrimitives: Invalid primitive");
            require(rateIsStale(aggregatorAddress), "removeStalePrimitives: Rate is not stale");

            delete primitiveToAggregatorInfo[_primitives[i]];
            delete primitiveToUnit[_primitives[i]];

            emit StalePrimitiveRemoved(_primitives[i]);
        }
    }

    
    
    function setStaleRateThreshold(uint256 _nextStaleRateThreshold)
        external
        onlyFundDeployerOwner
    {
        uint256 prevStaleRateThreshold = staleRateThreshold;
        require(
            _nextStaleRateThreshold != prevStaleRateThreshold,
            "__setStaleRateThreshold: Value already set"
        );

        staleRateThreshold = _nextStaleRateThreshold;

        emit StaleRateThresholdSet(prevStaleRateThreshold, _nextStaleRateThreshold);
    }

    
    
    
    function updatePrimitives(address[] calldata _primitives, address[] calldata _aggregators)
        external
        onlyFundDeployerOwner
    {
        require(_primitives.length > 0, "updatePrimitives: _primitives cannot be empty");
        require(
            _primitives.length == _aggregators.length,
            "updatePrimitives: Unequal _primitives and _aggregators array lengths"
        );

        for (uint256 i; i < _primitives.length; i++) {
            address prevAggregator = primitiveToAggregatorInfo[_primitives[i]].aggregator;
            require(prevAggregator != address(0), "updatePrimitives: Primitive not yet added");
            require(_aggregators[i] != prevAggregator, "updatePrimitives: Value already set");

            __validateAggregator(_aggregators[i]);

            primitiveToAggregatorInfo[_primitives[i]].aggregator = _aggregators[i];

            emit PrimitiveUpdated(_primitives[i], prevAggregator, _aggregators[i]);
        }
    }

    
    
    
    function rateIsStale(address _aggregator) public view returns (bool rateIsStale_) {
        return
            IChainlinkAggregator(_aggregator).latestTimestamp() <
            block.timestamp.sub(staleRateThreshold);
    }

    
    function __addPrimitives(
        address[] memory _primitives,
        address[] memory _aggregators,
        RateAsset[] memory _rateAssets
    ) private {
        require(
            _primitives.length == _aggregators.length,
            "__addPrimitives: Unequal _primitives and _aggregators array lengths"
        );
        require(
            _primitives.length == _rateAssets.length,
            "__addPrimitives: Unequal _primitives and _rateAssets array lengths"
        );

        for (uint256 i = 0; i < _primitives.length; i++) {
            require(
                primitiveToAggregatorInfo[_primitives[i]].aggregator == address(0),
                "__addPrimitives: Value already set"
            );

            __validateAggregator(_aggregators[i]);

            primitiveToAggregatorInfo[_primitives[i]] = AggregatorInfo({
                aggregator: _aggregators[i],
                rateAsset: _rateAssets[i]
            });

            
            uint256 unit = 10**uint256(ERC20(_primitives[i]).decimals());
            primitiveToUnit[_primitives[i]] = unit;

            emit PrimitiveAdded(_primitives[i], _aggregators[i], _rateAssets[i], unit);
        }
    }

    
    function __validateAggregator(address _aggregator) private view {
        require(_aggregator != address(0), "__validateAggregator: Empty _aggregator");

        require(
            IChainlinkAggregator(_aggregator).latestAnswer() > 0,
            "__validateAggregator: No rate detected"
        );
        require(!rateIsStale(_aggregator), "__validateAggregator: Stale rate detected");
    }

    
    
    

    
    
    
    function getAggregatorInfoForPrimitive(address _primitive)
        external
        view
        returns (AggregatorInfo memory aggregatorInfo_)
    {
        return primitiveToAggregatorInfo[_primitive];
    }

    
    
    function getEthUsdAggregator() external view returns (address ethUsdAggregator_) {
        return ethUsdAggregator;
    }

    
    
    function getStaleRateThreshold() external view returns (uint256 staleRateThreshold_) {
        return staleRateThreshold;
    }

    
    
    function getWethToken() external view returns (address wethToken_) {
        return WETH_TOKEN;
    }

    
    
    
    
    
    function getRateAssetForPrimitive(address _primitive)
        public
        view
        returns (RateAsset rateAsset_)
    {
        if (_primitive == WETH_TOKEN) {
            return RateAsset.ETH;
        }

        return primitiveToAggregatorInfo[_primitive].rateAsset;
    }

    
    
    function getUnitForPrimitive(address _primitive) public view returns (uint256 unit_) {
        if (_primitive == WETH_TOKEN) {
            return ETH_UNIT;
        }

        return primitiveToUnit[_primitive];
    }
}
