struct Persona{
    string Nombre;
    uint Edad;
}

mapping (uint => Persona) RelacionID;

function GuardarID(uint ID, string memory NombrePersona, uint EdadPersona) public{
    RelacionID[ID] = Persona(NombrePersona, EdadPersona);
}

function VerPersona(uint verID) public view returns(Persona){
    return RelacionID[verID];
}
