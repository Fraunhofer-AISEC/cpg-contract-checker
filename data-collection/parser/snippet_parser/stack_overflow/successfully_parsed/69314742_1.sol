    function donate(uint _id, uint amount) public payable {

        require(_id > 0 && _id <= proyectID); 

        
        Proyecto memory _proyect = proyects[_id];

        
        require(_proyect.donation < _proyecto.wantedDonation);

        
        address payable _author = _proyecto.author;

        
        _author.transfer(amount);

        
        _proyecto.donation = _proyecto.donation + amount;

        
        proyects[_id] = _proyect;

    }
