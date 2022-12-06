contract B {
  struct Player {
    uint id;
  } 
  mapping (uint=> Player) Players; 
}

contract A {
  constructor() public {
    B.Player storage p = B.Players[1];
  }
}
