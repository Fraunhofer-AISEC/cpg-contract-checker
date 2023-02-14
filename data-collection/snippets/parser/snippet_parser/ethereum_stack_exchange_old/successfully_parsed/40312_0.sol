uint id = zombies.push(Zombie(_name, _dna)) - 1;
zombieToOwner[id] = msg.sender;
