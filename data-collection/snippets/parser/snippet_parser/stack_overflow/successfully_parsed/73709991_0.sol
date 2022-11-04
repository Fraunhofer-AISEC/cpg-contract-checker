pragma solidity ^0.5.0; 


contract Types { 

  struct Player {
    string hasplayed;
    address my_address;
    uint wager;
  }

  Player[] public players; 

  uint[] data;

  function initialize(uint wager) public {
    players.push(Player("no", msg.sender, wager));  
  } 

  function length() public returns(uint) {
      uint len = players.length;
      return len;

  }

  function loop(
  ) public returns(uint[] memory){

  uint len = players.length;

  for(uint i=0; i<len; i++){
      Player storage myplayer = players[i];
      Player storage newestplayer = players[len];
      if (myplayer.wager == newestplayer.wager) {
          flip();
      }
      
      data.push(myplayer.wager);
  }
    return data;
  }

  function flip() public view returns(string memory) {
      return "flip";
  }
}
