contract myContract {
  struct Ownable {
    string name;
    address creator;
    address currentOwner;
    bool isDestructible;
    uint price;
  }

  mapping (uint => Ownable) public Ownables;

  function getOwnableInfo(uint OwnableId) public view returns (string, address, address, bool, uint){
    Ownable o = Ownables[OwnableId];
    return (o.name, o.creator, o.currentOwner, o.isDestructible, o.price);
  }

  /.../
}
