pragma solidity ^0.8.0;

contract TrainerTest {

    struct Pokemon {
        uint64 element;
        uint64 cp;
    }

    struct Trainer {
        address owner;
        string name;
        Pokemon[] pokemons;
    }

    mapping(address => Trainer) public trainersMap;

    function getTrainer() public view returns(Trainer memory) {
        return trainersMap[msg.sender];
    }
}
