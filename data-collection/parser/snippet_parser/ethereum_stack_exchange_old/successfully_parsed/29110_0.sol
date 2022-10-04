contract EntityFactory  {

    event EntityCreated(address entity);

    function createEntity (string _hash) public returns (Entity entity) {
        Entity ent = new Entity(_hash);

        EntityCreated(ent);
        return ent;
    }
}

contract Entity {
    string private hash;

    function Entity (string _hash) public {
        hash = _hash;
    }

    function getHash() public returns(string) { 
        return hash; 
    }
}
