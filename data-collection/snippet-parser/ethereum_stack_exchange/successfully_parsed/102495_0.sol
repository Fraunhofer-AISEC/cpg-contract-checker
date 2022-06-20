contract Coin {
   string public name;
   constructor(string _name) public { 
      name = _name;
   }
}
contract MetaCoin {
   Coin public coin;
   constructor(Coin _coin) public {
       coin = _coin;
   }
   
}
