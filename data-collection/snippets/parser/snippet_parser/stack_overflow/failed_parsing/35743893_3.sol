  event OnCreateRoom(address indexed _from, uint256 _value);

   struct Room {
      address[] players;       
      uint256 whosTurnId;
      uint256 roomState;
   }  

   Room[] rooms;

   function createRoom() public{
       address[] adr;
       adr.push(msg.sender);
       Room memory room = Room(adr, 0, 0);   
       rooms.push(room);
       OnCreateRoom(msg.sender, 0);
   }
