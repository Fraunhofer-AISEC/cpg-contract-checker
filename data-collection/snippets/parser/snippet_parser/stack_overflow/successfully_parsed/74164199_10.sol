function getPlayerListInGame(uint gameNumber) external returns (address[] memory player) {
        address[] memory playerListTmp = new address[](idToGame[gameNumber].playerList.length);
        for (uint i=0; i<idToGame[gameNumber].playerList.length; i++) {
            playerListTmp[i] = idToGame[gameNumber].playerList[i];
        }
        return playerListTmp;
    }
