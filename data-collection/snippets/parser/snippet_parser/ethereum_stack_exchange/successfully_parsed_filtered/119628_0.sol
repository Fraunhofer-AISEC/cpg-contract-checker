
pragma solidity ^0.8.10; 

import "../logica/Persona.sol";



contract PersonaDAO {
    
    
    event Log(string data);

    address public creador;

    mapping(address => Persona.PersonaStruct) public personas;

    constructor() public {
        creador = msg.sender; 
    }

    
    function consultar(address direccion)
        public
        returns (Persona.PersonaStruct memory)
    {
        
        emit Log("entro a consultar");
        
        Persona.PersonaStruct memory persona = personas[direccion];
        if (!persona.isValue) {
            emit Log("no existe el usuario");
            revert("No existe ese paciente");
        }
        emit Log("usuario valido");
        return persona;
    }

    
    function guardar(address direccion, Persona.PersonaStruct memory persona) public {
        
        
        personas[direccion] = persona;
    }
}

