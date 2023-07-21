struct Pokemon {
  uint id;
  string name;
}

struct Type {
  string name;
  string description;
}

struct Habilities {
  string name;
  string description;
}

struct Weaknesses {
  string name;
  string description;
}

Pokemon[] private pokemons;
Habilities[] private hability;
Type[] private pokemontype;
Weaknesses[] private weaknesses;

mapping (uint => Type) public pokemonType;
mapping (uint => address) public pokemonToOwner;
mapping (address => uint) ownerPokemonCount;

event eventNewPokemon(string message, string name, uint indexed id);

constructor () public {
  string[5] data; 
  
  function typepo () public returns (string[5] memory) {
    data = ["1", "2", "3", "4", "5"];
    return data;
  }
}

function createPokemon (string memory _name, uint _id) public {
  require(_id > 0, "El id debe ser mayor a 0");
  require(bytes(_name).length > 2, "El nombre no debe estar vacio y ser mayor a 2 caracteres");

  pokemons.push(Pokemon(_id, _name));
  pokemonToOwner[_id] = msg.sender;
  ownerPokemonCount[msg.sender]++;
    
  emit eventNewPokemon("Nuevo Pokemon Creado", _name, _id);
}

function getAllPokemons() public view returns (Pokemon[] memory) {
  return pokemons;
}

function getResult() public pure returns(uint product, uint sum){
  uint a = 1; 
  uint b = 2;
  product = a * b;
  sum = a + b; 
