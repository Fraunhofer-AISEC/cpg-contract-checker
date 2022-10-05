  contract AssetFactory {
    Asset[] public deployedAssets;

  function createAsset(string name) public returns (Asset) {
    Asset newAsset = new Asset(name);
    deployedAssets.push(newAsset);
    return newAsset;
  }

  function isFactory() public pure returns(bool isIndeed) {
    return true;
  }
}

contract Asset {
  string public name;
  AssetFactory factory;

  event LogAsset(address sender, bool isFactory);

  function Asset(string _name) public {
    name = _name;
    factory = AssetFactory(msg.sender);
  }

  

  function modifyAssetAndCreateNew(string _name) public {
    factory.createAsset(_name);
    name = _name;
  }   
}
