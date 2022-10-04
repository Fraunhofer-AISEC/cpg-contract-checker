struct Collection {
    uint collectionId;
    uint collectionType;
    address collectionOwnerAddress;
    uint value;
}

Collection[] public collections;

function getCollection (uint _collectionId) view public returns (uint) {
     return collections[_collectionId].value;
}
