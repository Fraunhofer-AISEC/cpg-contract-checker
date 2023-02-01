    function viewChange() public view returns (bytes20, string, uint256, uint256) {
    return (_currentChange.gitHash, _currentChange.additionalInformation, _currentChange.costs, _currentChange.estimation);
}
