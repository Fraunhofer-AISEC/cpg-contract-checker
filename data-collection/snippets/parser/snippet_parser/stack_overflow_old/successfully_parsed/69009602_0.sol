function getProyect(uint memory _id) public returns (uint, string, string, address){
        Proyect memory _proyect = proyects[_id];
        return(_proyect.id, _proyect.hash,_proyect.name,_proyect.author);
    }
