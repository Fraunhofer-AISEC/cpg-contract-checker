struct Zombie {
  string name;
  uint dna;
  uint32 level;
  uint32 readyTime;
  uint16 winCount;
  uint16 lossCount;
}

Zombie[] public zombies;

mapping (uint => address) public zombieToOwner;
mapping (address => uint) ownerZombieCount;

function _createZombie(string memory _name, uint _dna) internal {
    uint id = zombies.push(Zombie(_name, _dna, 1, uint32(now + cooldownTime), 0, 0)) - 1;
    zombieToOwner[id] = msg.sender;
    ownerZombieCount[msg.sender]++;
    emit NewZombie(id, _name, _dna);
}
