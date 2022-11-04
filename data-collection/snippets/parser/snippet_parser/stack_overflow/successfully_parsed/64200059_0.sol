pragma solidity ^0.7.2;

contract Campaign {
    struct Usuario {
        string id;
        mapping(string => uint) debe;
        mapping(string => uint) leDebe;
        
    }
    
    Usuario[] public usuarios;
    uint numUsuarios;
    mapping(string => Usuario) public circulo;
    
    constructor () {
        
    }
    
    function usuarioPrueba(string memory id, string memory idDebe, uint valDebe, string memory idLeDebe, uint valLedebe) public {
        
        usuarios.push();
        Usuario storage newUsuario = usuarios[numUsuarios];
        numUsuarios++;
        newUsuario.id = id;
        newUsuario.debe[idDebe] = valDebe;
        newUsuario.leDebe[idLeDebe] = valLedebe;
        
        circulo[id] = newUsuario;
    }
   
}
