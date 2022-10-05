 mapping(string => Owner) public Owners;

    function addOwner( string memory name, string memory surname, string memory fathername, string memory mothername, string memory ethnicityId, string memory id) public returns(int8)
    {
        Owner memory owner;
        owner.name = name;
        owner.surname = surname;
        owner.fathername = fathername;
        owner.mothername = mothername;
        owner.ethnicityId = ethnicityId;
        owner.id = id;

        Owners[id] = owner;
        return 0;
    }

    function getOwnerName(string memory id) public returns(string memory, string memory) {
        Owner storage owner = Owners[id];
        return (owner.name, owner.surname);
    }


