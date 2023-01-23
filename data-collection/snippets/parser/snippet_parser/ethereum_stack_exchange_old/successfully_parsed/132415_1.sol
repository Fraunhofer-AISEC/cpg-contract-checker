    function getEachRoom(uint256 _index) public view returns (Room memory) {
        return eachRoomNumberToEachRoom[totalRoom][_index];
    }
