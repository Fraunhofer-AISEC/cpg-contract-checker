function sweep(address _token, uint _amount)
returns (bool) {
    (_amount);
    return sweeperList.sweeperOf(_token).delegatecall(msg.data);
}
