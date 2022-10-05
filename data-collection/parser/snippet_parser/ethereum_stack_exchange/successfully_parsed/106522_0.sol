struct Parent {
        bytes32[] items;
        bytes32[] removed_items;
    }
mapping(bytes32 => Parent) public Parents;

struct Item {
    bytes32 hash;
    string content;
    address author;
    bytes32 parent;
}

function RemoveItem(bytes32 _ParentHash, bytes32 _Hash)
        public
        Owner
    {
        require(
            Parent[_ParentHash].author != address(0),
            "Parent does not exist"
        );
        require(
            Parent[_ParentHash].items[_Hash].author != address(0), 
            "Item does not exist"
        );
    }
