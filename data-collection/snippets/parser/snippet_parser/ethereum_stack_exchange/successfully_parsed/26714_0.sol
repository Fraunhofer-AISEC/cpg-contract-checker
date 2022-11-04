contract EtherWorldStorage {
    
    address owner;
    mapping (bytes32 => World) Gameworlds;

    mapping (bytes32 => uint) NamesIndex;
    World[] worldContracts;

    function EtherWorldStorage(){
        owner = msg.sender;
    }


    event WorldCreated(bytes32 indexed worldName, address indexed sender, address result );

    function createWorld(bytes32 name) returns (address a){
        if(NamesIndex[name] > 0x0){
            return 0x0;
        }
        World w = new World(name);
        NamesIndex[name] = worldContracts.length - 1;
        Gameworlds[name] = w;
        WorldCreated(name,msg.sender,w);
        return w;
    }

  function getWorldCount() returns (uint i){
        return worldContracts.length;
    }

    function destroyWorld(bytes32 world){

        World w = Gameworlds[world];
        w.destroy(owner);
    }


function getItemPossessorsInventory(InventoryItem item) returns (address a){
        return item.getOwningInventory();
    }

}
