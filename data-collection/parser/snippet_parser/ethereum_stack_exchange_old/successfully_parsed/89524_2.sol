
pragma solidity >=0.7.0 <0.8.0;

contract ContratoUsuario {
    string public nombre;

    constructor() public {
        nombre = "Contrato de Usuarios";
    }

    struct Usuario {
        string sNombre;
        string sApellido;
    }
    mapping(address => Usuario) private Usuarios;
    mapping(address => bool) private UsuariosUnidos;
    address[] aUsuarios;

    event eUsuarioUnido(address, string);

    function Unirse(string memory cdNombre, string memory cdApellido) public {
        require(!UsuarioRegistrado(msg.sender));
        Usuario storage Usuario1 = Usuarios[msg.sender];
        Usuario1.sNombre = cdNombre;
        Usuario1.sApellido = cdApellido;
        UsuariosUnidos[msg.sender] = true;
        aUsuarios.push(msg.sender);
        emit eUsuarioUnido(msg.sender, string (abi.encodePacked(Usuario1.sNombre, " ", Usuario1.sApellido)));
    }

    function ObtenerUsuario(address Direccion) public view returns (string memory, string memory) {
        require(UsuarioRegistrado(msg.sender));
        Usuario memory Usuario1 = Usuarios[Direccion];
        return (Usuario1.sNombre, Usuario1.sApellido);
    }

    function UsuarioRegistrado(address Direccion) private view returns (bool) {
        return UsuariosUnidos[Direccion];
    }

    function UsuariosTotales() public view returns (uint) {
        return aUsuarios.length;
    }

}
