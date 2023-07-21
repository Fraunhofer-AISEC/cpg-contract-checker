function getGasCostOfObserve(uint32[] calldata secondsAgos) external view returns (uint256) {
    (uint32 _time, int24 _tick, uint128 _liquidity, uint16 _index) = (time, tick, liquidity, index);
    uint256 gasBefore = gasleft();
    observations.observe(_time, secondsAgos, _tick, _index, _liquidity, cardinality);
    return gasBefore - gasleft();
}
