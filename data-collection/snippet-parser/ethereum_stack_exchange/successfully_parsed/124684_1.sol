
pragma solidity 0.8.0;

contract Test {

    mapping(address => TokenLiq) _liq;

    struct TokenLiq {
        uint amountIn;
        uint[] biLiq;
        uint[] triLiq;
    }

    modifier checkLengthArray(uint _lengthArray, uint _length) {
        require((_lengthArray <= 3 && _lengthArray > 1) &&
                (_length <= 3 && _length > 1), "Error");
        _;        
    }

    function addLiq(uint[] memory amountsArray_, uint length_) public {
        TokenLiq memory t = _calculateTokenAmount(amountsArray_, length_);
        _liq[msg.sender] = t;
    }

    function _calculateTokenAmount(uint[] memory amountsArray_, uint length_) checkLengthArray(amountsArray_.length, length_) private pure returns(TokenLiq memory tokens) 
    {
        uint tokenAmount;
        uint[] memory _amounts = new uint[](length_);
        for(uint i = 0; i < _amounts.length; i++){
            _amounts[i] = amountsArray_[i];
        }

        tokenAmount = s.tricrypto.calc_token_amount(_amounts, true);
        tokens.amountIn = tokenAmount;

        if(_amounts.length == 2)
            tokens.biLiq = _amounts;
        else if(_amounts.length == 3)
            tokens.triLiq = _amounts;
    }

    function _getBiLiq() external view returns(uint[] memory) {
        return _liq[msg.sender].biLiq;
    }

    function _getTriLiq() external view returns(uint[] memory) {
        return _liq[msg.sender].triLiq;
    }

    function _getAmountIn() external view returns(uint) {
        return _liq[msg.sender].amountIn;
    }
}
