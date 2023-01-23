

pragma solidity >=0.7.0 <0.9.0;

contract PokemonFactory {

  struct Pokemon {
    uint256 id;
    string name;
    Ability[] abilities;
  }

  struct Ability {
    string name;
    string description;
  }

  Pokemon[] public pokemons;

  function createPokemon(string memory _name, string memory _abilityNme, string memory _abilityDscription) public {
    uint id = pokemons.length;
    pokemons[id].abilities.push(Ability(_abilityNme, _abilityDscription));
    pokemons.push(Pokemon(id, _name, pokemons[id].abilities));
  }
}
