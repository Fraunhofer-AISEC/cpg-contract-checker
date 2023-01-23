struct Persona{
    string name;
    uint age;
    uint weight;
    uint number;
    uint position;
    address[] propuestasVotadas;
}

address personaAutorizada;

mapping(address => Persona) public personas;
address[] public personasList;

function Censo(){
    personaAutorizada = msg.sender;
}

function existePersona(address _address) public constant returns(bool){

    if(personasList.length == 0) return false;
    return (personasList[personas[_address].position] == _address);
}

function addPersona(address _address, string _name, uint _age, uint _weight, uint _number) public{

    require(!existePersona(_address));

    personas[_address].name = _name;
    personas[_address].age = _age;
    personas[_address].weight = _weight;
    personas[_address].number = _number;
    personas[_address].position = personasList.push(_address) - 1;

}

function getNumPersonas() public returns(uint){

    return personasList.length;
}
