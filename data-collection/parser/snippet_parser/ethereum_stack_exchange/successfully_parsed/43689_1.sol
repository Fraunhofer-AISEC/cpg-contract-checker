function getCollection (uint _collectionType) view public returns (uint) {
     
     return collections[msg.sender].value;
}
