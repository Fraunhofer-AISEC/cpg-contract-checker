 Zombie[] public zombies;

function createZombie (string memory _name, uint _dna) public {
        Zombie storage firstZombie=zombies[0]
        
        firstZombie.name=_name
        
    }
