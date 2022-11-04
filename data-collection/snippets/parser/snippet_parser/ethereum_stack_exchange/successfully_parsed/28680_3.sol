function getCurrentEggs() constant returns (uint[10]) {
    return listOfPlayers[msg.sender].listOfEggs;
    }
