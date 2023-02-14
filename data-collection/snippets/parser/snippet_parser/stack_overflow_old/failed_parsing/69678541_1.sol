Item[] public items;

event MarketItem(
    bytes32 title,
    uint8 price,
    bool sold,
    bool published,
    address owner
);

mapping(address => Item) public itemToOwner;

function addItem(bytes32 _title, uint8 _price) public {
    Item memory newItem = Item({
        title: _title,
        price: _price,
        sold: false,
        published: true,
        owner: msg.sender
    });
    items.push(newItem);
}
