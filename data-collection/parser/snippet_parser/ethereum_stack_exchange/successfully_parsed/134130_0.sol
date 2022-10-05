    function addAllPotentialWinnings(
        uint256 _eventNumber,
        uint256[][] memory _potentialWinnings,
        uint256[] memory _chainsList,
        address[] memory _winnersList
    ) public onlyOwner {
        winnersList[_eventNumber] = _winnersList;
        updateChains(_eventNumber, _chainsList);
        for (uint i = 0; i < _winnersList.length; i++) {
            updatePotentialWinnings(_eventNumber,_winnersList[i],_potentialWinnings[i]);}}
