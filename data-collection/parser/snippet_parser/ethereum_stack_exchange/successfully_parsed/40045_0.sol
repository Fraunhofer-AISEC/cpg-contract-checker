pragma solidity ^0.4.18;

contract StructArrayInitWrong {
  struct Room {
    address[] players;       
  }  
  Room[] rooms;

  function createRoom() public {
    address[] adr;
    adr.push(msg.sender);
    Room memory room = Room(adr);   
    rooms.push(room);
  }

  function getRoomsLength() view returns (uint) {
    return rooms.length;
  }
}
