contract transfer{

  uint nextItemId;
  mapping(uint32 => address[]) public owners;

  function createAsset(string name, uint256 price) public
  {
      Asset memory newAsset = Asset(name, price); 
      owners[nextItemId].push(msg.sender);
      nextItemId = nextItemId + 1;
    }

  function transferProduct(uint32 id) public payable {
    owners[id].push(address((msg.sender)));

  }
}
