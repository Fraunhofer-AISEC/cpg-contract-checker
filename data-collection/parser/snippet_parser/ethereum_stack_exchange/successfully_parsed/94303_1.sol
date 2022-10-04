    function _totalSupply() internal view returns (uint256) {
    return getUint256(_TOTAL_SUPPLY_SLOT);
    }

    function _setTotalSupply(uint256 _value) internal {
        setUint256(_TOTAL_SUPPLY_SLOT, _value);
    }
