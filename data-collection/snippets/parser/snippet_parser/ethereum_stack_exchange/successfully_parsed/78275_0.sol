pragma solidity ^0.5.7;

contract Votacion{
mapping(uint => address[]) private votosCandidatos;
uint[] listaCandidatos;
bool abierta;

address private creador=msg.sender;

constructor(uint[] memory candidatosIds) public{
    listaCandidatos = candidatosIds;
    abierta = false;
    for (uint i = 0; i < candidatosIds.length; i++)
    {
        votosCandidatos[candidatosIds[i]];
    }
}

function ind(address[] memory v, address e) public pure returns (bool){
    bool found = false;

    for(uint i = 0; i < v.length && !found; i++)
    {
        found = v[i] == e;
    }

    return found;
}

function votar(uint candidato) public{
    bool ya_votado = false;

    for (uint i = 0; i < listaCandidatos.length && !ya_votado; i++)
    {
        ya_votado = ind(votosCandidatos[listaCandidatos[i]],msg.sender);
    }

    require(!ya_votado,"Ya ha ejercido su derecho a voto");
    
    require(abierta,"La votación no es accesible en este momento");
    
    votosCandidatos[candidato].push(msg.sender);
}

function abrir() public{
    require(msg.sender == creador,"Permiso denegado");
    abierta = true;
}

function cerrar() public{
    require(msg.sender == creador,"Permiso denegado");
    abierta = false;
}

function revisar_voto() public view returns (uint)
{
    require(!abierta,"La votación no ha terminado aun");
    bool ya_votado = false;
    uint res;

    for (uint i = 0; i < listaCandidatos.length && !ya_votado; i++)
    {
        ya_votado = ind(votosCandidatos[listaCandidatos[i]],msg.sender);
        res = i;
    }

    return res;
}

function resultados() public view returns (uint[] memory){
    require(!abierta,"La votación no ha terminado aun");

    uint[] memory resul = new uint[](listaCandidatos.length);

    for (uint i = 0; i < listaCandidatos.length; i++)
    {
        resul[i] = votosCandidatos[listaCandidatos[i]].length;
    }

    return resul;
}
}
