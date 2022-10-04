    contract AssetFactory{

    address[] deployedAssets;

      function createAsset(string name) public {
        address newAsset = new Asset(name);
        deployedAssets.push(newAsset);
        return newAsset;
      }

    }

    contract Asset{

     string name;

     function Asset(string name) public{
       name = name;
     }

     function ModifyAssetAndCreateNew(string name, address factory){
       factory.createAsset(name);
       name = name;
     }

   }
