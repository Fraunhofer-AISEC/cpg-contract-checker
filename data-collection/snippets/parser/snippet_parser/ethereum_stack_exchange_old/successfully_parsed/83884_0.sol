pragma solidity ^0.6.0;

contract MyContract {

    enum Statuses {Vacant,Occupied}
    uint internal counter = 0;
    event occupied (string cname, address raddr);
    uint public constant totalRooms = 5;
    struct Room{
        address roomAddress;
        Statuses roomStatus;
    }

    mapping(uint => Room) public rooms;

    function roomInfo() public {
        rooms[1] = Room(0x33c5E8069F3F5b653fEDdE8c628B1e0DE48382a1,Statuses.Vacant);
        rooms[2] = Room(0x88789bB3d6B1eF931d3DF5aB008A38F86EA3da8d,Statuses.Vacant);
        rooms[3] = Room(0xDaEf09dE138de7C27f1a43cA6c544c1a6A50BAf9,Statuses.Vacant);
        rooms[4] = Room(0xC72C577e4450E4AAF9eaf2FF3ff6b3eC597F894b,Statuses.Vacant);
        rooms[5] = Room(0xF68af2bAC4c9Db4a27186C6382eAD0c0BA04638F,Statuses.Vacant);
    }


    
    mapping(uint => Customer) public customers;


    struct Customer {
        address _address;
        string name;
        address room;
    }


    constructor() public {

    }


    function addCustomer(address _add, string memory _name) public {
        address _room;
        while(counter<=totalRooms){
            for(uint i =0; i< totalRooms;i++){
                if(rooms[i].roomStatus==Statuses.Vacant)
                  _room = rooms[i].roomAddress;
                else 
                i++;
            }
            customers[counter+1] = Customer(_add, _name,_room);
        }

        emit occupied(_name,_room);
    }


}
