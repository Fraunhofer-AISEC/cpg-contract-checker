contract Entity{
    event Entities(string name);
    struct Entity{
        string name;
    }
    uint32 public entityId;
    mapping(uint32 => Entity) entities;
    function insert(string name) returns (uint32 returnId){
         returnId = ++entityId;
         entities[returnId] = Entity(name);
         Entities(name);
         return returnId;
    }
}
