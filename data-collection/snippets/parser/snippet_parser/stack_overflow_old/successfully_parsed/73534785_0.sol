struct Psoukrace {

    string name;
    string title;
    uint level;

    uint HP;
    uint defence;
    uint dodge;
    uint luck;
    uint intelligence;
    uint strenghth;
    uint attack;
    uint speed;

}

Psoukrace [] public psoukraces;


function _createPsoukrace( string memory name, string memory title, uint  level, uint HP, uint defence, uint dodge, uint luck, uint intelligence, uint strength, uint attack, uint speed) public view returns (string memory, uint) {
   psoukraces.push(Psoukrace(name, title, level, HP, defence, dodge, luck, intelligence, strength, attack, speed));
   return ("test1",
   "test2",
   1,
   2,
   3,
   4,
   5,
   6,
   7,
   8,
   9);
  
}
