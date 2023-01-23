contract TheGame {
    uint256 totalRoom;

    struct Room {
        address player;
        uint256 amount;
    }
    Room[] public room;

    mapping(uint256 => Room[]) public eachRoomNumberToEachRoom;

    function createRoom(uint256 _amount) public {
        room.push(Room({
            player: msg.sender,
            amount: _amount
        }));
        totalRoom += 1;
        eachRoomNumberToEachRoom[totalRoom] = room;
    }

    function getEachRoom(uint256 _index) public view returns () {
        return eachRoomNumberToEachRoom[totalRoom][_index];
    }
}
