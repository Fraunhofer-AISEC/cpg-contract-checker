    uint256 private constant MAX = ~uint256(0);
    uint256 private constant _tTotal = 10 * 10**6 * 10**9;
    uint256 private _rTotal = (MAX - (MAX % _tTotal));
    uint256 private _tFeeTotal;

    function _reflectFee(uint256 rFee, uint256 tFee) private {
      _rTotal = _rTotal.sub(rFee);
      _tFeeTotal = _tFeeTotal.add(tFee);
    }
