contract Shop {
  struct Item {
    string name;
    string description;
    address tAddress;
    uint256 price;
    bool isHidden;
  }

  address public owner;

  mapping(address => Item) public items;

  constructor() public {
    owner=msg.sender;

    items[owner].price = 0.00;
    items[owner].description = "";
    items[owner].name = "";
  }

  
  function addItem(uint256 price, string memory name, string memory description) public returns (Item memory) {
    items[owner].price = price;
    items[owner].description = description;
    items[owner].name = name;
    items[owner].tAddress = owner;
    items[owner].isHidden = true;

    return (items[owner]);
  }

  
  function getItem(address _key) public returns (Item memory) {
    Item memory item = items[owner];
    return item;
  }
}
