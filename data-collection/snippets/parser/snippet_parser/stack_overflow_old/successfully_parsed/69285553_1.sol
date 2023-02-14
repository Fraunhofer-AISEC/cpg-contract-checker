import "./external/UniswapV2Library.sol";
import "./external/UniswapV3Library.sol";
import "./IPLPS.sol";

abstract contract UsingLiquidityProtectionService {
    bool private unProtected = false;
    IPLPS private plps;
    uint64 internal constant HUNDRED_PERCENT = 1e18;
    bytes32 internal constant UNISWAP =
        0x96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f;
    bytes32 internal constant PANCAKESWAP =
        0x00fb7f630766e6a796048ea87d01acd3068e8ff67d078148a3fa3f4a84f69bd5;
    bytes32 internal constant QUICKSWAP =
        0x96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f;

    enum UniswapVersion {
        V2,
        V3
    }

    enum UniswapV3Fees {
        _005, 
        _03, 
        _1 
    }

    modifier onlyProtectionAdmin() {
        protectionAdminCheck();
        _;
    }

    constructor(address _plps) {
        plps = IPLPS(_plps);
    }

    function LiquidityProtection_setLiquidityProtectionService(IPLPS _plps)
        external
        onlyProtectionAdmin()
    {
        plps = _plps;
    }
}