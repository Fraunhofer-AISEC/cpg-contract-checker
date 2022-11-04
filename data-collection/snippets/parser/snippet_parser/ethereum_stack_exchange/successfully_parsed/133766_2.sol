function addAllPotentialWinnings(uint256 _eventNumber, uint256[][] memory _potentialWinnings, address[] memory _usersList) public {
        for (uint i =0; i<_usersList.length;i++){
            updatePotentialWinnings(_eventNumber,_usersList[i],_potentialWinnings[i]);
        }
    }
