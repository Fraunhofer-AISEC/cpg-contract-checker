function getProyect(uint _id) public returns (uint, string memory hs, string memory nm, address){
        Proyect memory _proyect = proyects[_id];
        hs = _proyect.hash;
        nm = _proyect.name;
        return(_proyect.id, hs, nm, _proyect.author);
    }
