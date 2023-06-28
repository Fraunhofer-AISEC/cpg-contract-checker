struct Shop {
    string name;
    uint id;
}

Shop[] Shops;

uint GlobalId;

constructor() {
    createNewShop("First");
    createNewShop("Second");
    createNewShop("Third");
}

function createNewShop(string memory _name) public {
    Shops.push(Shop(_name, GlobalId));
    GlobalId++;
}

function searchIndex(uint _id) public view returns(uint) {
    uint index;
    for(uint i = 0; i <= Shops.length; i++) {
        if(Shops[i].id == _id) {
            index = Shops[i].id; 
        }
    }
    return(index);
}
