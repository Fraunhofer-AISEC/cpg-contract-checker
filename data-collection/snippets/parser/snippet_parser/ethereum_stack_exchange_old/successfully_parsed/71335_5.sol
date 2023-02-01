contract transfer{

  uint lenghtcounter;
  mapping(uint => address[]) public owners;

  function createAsset(string name, uint price) public
  {
      uint id = getRandom(); 

      Asset memory newAsset = Asset(name, price); 

      owners[id].push(msg.sender);
    }

  function transferProduct(uint id) public payable {
    uint temp = lenghtcounter + 1;
    owners[id].push(msg.sender)+temp ;
    lenghtcounter = temp;
  }
}
