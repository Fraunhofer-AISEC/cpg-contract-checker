function newCollection() public {
    
    collections.length += 1;

    
    Collection storage collection = collections[collections.length - 1];

    
    collection.collectionCreator = msg.sender;
    
}
