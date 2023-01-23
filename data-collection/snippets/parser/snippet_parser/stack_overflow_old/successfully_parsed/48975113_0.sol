contract ItemMarket is ERC721 {
  struct Item {
    string name;
    uint[3] others;
  }

  Item[] public items;

  function createItem(string _name, uint[6] _others) public {
    uint tokenId = items.push(Item({name: _name, traits:_traits})) - 1;
  }
}
