struct Cake {
    uint id;
    address buyer;
}

mapping (uint => Cake) public cakes;
uint[] public cakeIds;

function addNewCake(uint _id) public {
    cakes[_id] = Cake(_id, 0x0);

    cakeIds.push(_id);
}

function buyCake(uint _id) public {      
    Cake storage cake = cakes[_id];       
    cake.buyer = msg.sender;

    removeCakeInArray(_id);
}

function removeCakeInArray(uint _id) private {
    for (uint i = 0; i <= getNumOfCakes(); i++) {            
        if (cakeIds[i] == _id) {
            remove(i);                 
        }    
    }
}

function remove(uint index) private {
    if (index >= getNumOfCakes()) return;

    for (uint i = index; i < getNumOfCakes() - 1; i++){
        cakeIds[i] = cakeIds[i+1];
    }
    cakeIds.length--;
}

function getAllUnsoldCakes() public view returns (uint[]) {
    uint length = getNumOfCakes();  
    uint[] memory ids = new uint[](length);

    for (uint i = 0; i < length; i++) {       
        uint cakeId = cakeIds[i];
        Cake memory cake = cakes[cakeId];

        if (cake.buyer == 0x0) {
            ids[i] = cake.id;             
        }
    }

    return ids;
}

function getNumOfCakes() public view returns (uint) {
    return cakeIds.length;
}
