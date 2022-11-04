
    function addOwner(string[] memory _name, address[] memory _owner_address,uint _confirmationOfOwner)
     public
     onlyOwner 
     {
        require(_owner_address.length > 0,"Owner is required");
        require(_name.length > 0,"Owner's name is required");
        require(_owner_address.length == _name.length,"Each owner mush have name");
        require(_confirmationOfOwner > 0 && _confirmationOfOwner <= _owner_address.length + owners.length,"Confirmation of the owner is invalid");
        for(uint i = 0; i <_owner_address.length; i++ ){
            
            require(_owner_address[i] != address(0), "invalid owner");
            require(!isOwner[_owner_address[i]], "owner not unique");

            isOwner[_owner_address[i]] = true;
            owners.push(Owner({name:_name[i],owner_address:_owner_address[i]}));
        }
        confirmationOfOwner = _confirmationOfOwner;
    }
