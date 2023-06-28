pragma solidity ^0.4.22;

contract Item {
    Item public next;
    address owner;

    constructor(Item _next) public {
        owner = msg.sender;
        if (_next == Item(0)) {
            next = this;
        } else {
            next = _next;
        }
    }

    function addNew(Item item) public {
        require(msg.sender == owner);
        next = item;
    }
}

contract Factory {
    Item public head;

    constructor() public {
        head = new Item(Item(0));
    }

    function add(Item _to) public {
        Item link = _to.next();
        Item next = new Item(link);
        _to.addNew(next);
    }
}
