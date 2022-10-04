function stakeOnBehalf(address _staker, uint256 _value, bytes32 _tag, uint256 _tournamentID, uint256 _roundID, uint256 _confidence) stopInEmergency onlyPayloadSize(6) returns (bool ok) {
    return delegateContract.delegatecall(bytes4(sha3("stakeOnBehalf(address,uint256,bytes32,uint256,uint256,uint256)")), _staker, _value, _tag, _tournamentID, _roundID, _confidence);
}
