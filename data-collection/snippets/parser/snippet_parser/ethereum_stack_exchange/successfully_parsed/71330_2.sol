    event RegistroQueja(address contrato);

    function registrarQueja(string memory _descripcion, string memory _nombre, string memory _correo, string memory _fecha) public {
        address contrato = address(new Queja(_descripcion, _nombre, _correo, _fecha));
        contratos.push(contrato);
        emit RegistroQueja(contrato);
}