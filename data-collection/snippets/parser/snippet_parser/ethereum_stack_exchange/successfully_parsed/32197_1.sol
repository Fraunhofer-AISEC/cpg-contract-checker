struct Propuesta{
    string nombre;
    string descripcion;
    uint numVotos;
    uint position;
}

event PropuestaAdded(address _address, uint now);
event PersonaVotePropuesta(address _addressPropuesta, address _addressPersona, uint now);

mapping(address => Propuesta) propuestas;
address[] propuestasList;

address personaAutorizadaMinisterio;

function MinisterioInterior(){
    personaAutorizadaMinisterio = msg.sender;
}

function existePropuesta(address _address) returns(bool){

    if(propuestasList.length == 0) return false;
    return (propuestasList[propuestas[_address].position] == _address);
}

function crearPropuesta(address _address, string _nombre, string _descripcion) returns(bool){

    require(!existePersona(_address));
    propuestas[_address].nombre = _nombre;
    propuestas[_address].descripcion = _descripcion;
    propuestas[_address].numVotos = 0;
    propuestas[_address].position = propuestasList.push(_address) - 1;
    return true;
}
