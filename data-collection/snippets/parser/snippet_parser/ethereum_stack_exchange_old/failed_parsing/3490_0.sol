contract MyGame {
  struct Register {
    bool played;
  }
  mapping (address => Register) players;  
  Register Reg;

  function Play {
    players[msg.sender].played=true;
  }

  function SetUp {
    
    delete Reg;
  }
}
