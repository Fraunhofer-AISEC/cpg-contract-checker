contract transfer{

  mapping(uint => address[]) public owners;

  function createAsset(string name, uint price) public
  {
      uint id = getRandom(); 

      Asset memory newAsset = Asset(name, price); 

      owners[id].push(msg.sender);

    }

  function transferProduct(uint id) public payable {
    owners[id].push(address((msg.sender)));

  }
}
