pragma solidity ^0.4.18;

contract StructArrayInitWrong {

  struct Room {
    address[] players;       
  }  
  Room[] rooms;
  address[] adr; 

  function createRoom() public {
                                    
    adr.push(msg.sender);
    Room memory room = Room(adr);   
    rooms.push(room);
  }

  function getRoomsLength() public view returns (uint) {
    return rooms.length;
  }
}
