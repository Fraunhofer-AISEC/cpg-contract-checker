function payPlayers(address[] memory players, uint256[] memory values) public payable returns (bool[] memory result) {
        result = new bool[](players.length);
        for (uint i = 0; i < players.length; i++) {
            result[i] = false;
            (bool success, ) = players[i].call{value: values[i]}("");
            if (success) {
                result[i] = true;
            }            
        }
        return result;
    }
