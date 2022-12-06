    function getProyect(uint _id) public returns (uint, string memory, string memory, address){
        Proyect memory _proyect = proyects[_id];
        return(_proyect.id, _proyect.hash,_proyect.name,_proyect.author);
    }
