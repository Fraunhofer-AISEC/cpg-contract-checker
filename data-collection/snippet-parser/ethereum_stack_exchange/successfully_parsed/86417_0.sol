import "./Investor.sol";
import "./IKyberNetworkProxy.sol";

contract Trader is Investor {

    uint256 public platformFeeBps;

    constructor(
        IKyberNetworkProxy _kyberProxy,
        uint256  _platformFeeBps
    ) public
    {
        kyberProxy = _kyberProxy;
        platformFeeBps = _platformFeeBps;
    }

    function getConversionRates(
        IERC20 srcToken,
        IERC20 destToken,
        uint256 srcQty
    ) public
      view
      returns (uint256)
    {
      return kyberProxy.getExpectedRateAfterFee(srcToken, destToken, srcQty, platformFeeBps, '');
    }

}
