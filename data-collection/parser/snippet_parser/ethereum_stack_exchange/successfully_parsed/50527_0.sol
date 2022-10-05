function power(uint256 _baseN, uint256 _baseD, uint32 _expN, uint32 _expD) internal view returns (uint256, uint8) {
    assert(_baseN < MAX_NUM);

    uint256 baseLog;
    uint256 base = _baseN * FIXED_1 / _baseD;
    if (base < OPT_LOG_MAX_VAL) {
        baseLog = optimalLog(base);
    }
    else {
        baseLog = generalLog(base);
    }

    uint256 baseLogTimesExp = baseLog * _expN / _expD;
    if (baseLogTimesExp < OPT_EXP_MAX_VAL) {
        return (optimalExp(baseLogTimesExp), MAX_PRECISION);
    }
    else {
        uint8 precision = findPositionInMaxExpArray(baseLogTimesExp);
        return (generalExp(baseLogTimesExp >> (MAX_PRECISION - precision), precision), precision);
    }
}
