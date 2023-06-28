struct Trainer {
    address owner;
    string name;
    Pokemon[] pokemons;
}

mapping(address => Trainer) public trainersMap;

function getTrainer() public {
    address sender = msg.sender;
    return Trainer(sender, trainersMap[sender].name, trainersMap[sender].pokemons);
    
    

}
