struct room {
string roomNumber;
uint256 cost;
bool avaiability;
}

mapping (uint => room) rooms;

room[] public hotelRooms;

function addRoom (uint _index, string memory _roomNumber, uint 
_cost) public {
    room storage r = rooms[_index];
    rooms[_index] = room(_roomNumber, _cost, true);
    hotelRooms.push(r);
    freeRooms ++;
}

function book(uint _roomNumber) public payable {
    require(rooms[_roomNumber-1].avaiability == true, "this room 
    is not avayable");
    require(msg.value >= rooms[_roomNumber-1].cost, "this room 
    costs much");
    payable(owner).transfer(msg.value);
    rooms[_roomNumber - 1].avaiability = false;
}
