Collection[] public collections;

struct Book {
    string name;
    address writer;
    bytes32 proof;
}

struct Collection {
    Book[] books;
    address collectionCreator;
}


function newCollection() public {
    collections.append(Collection({
        collectionCreator: msg.sender,
        
        books: <HELP>
    }))
}
