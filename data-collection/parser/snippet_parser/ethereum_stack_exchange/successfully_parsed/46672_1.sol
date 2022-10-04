pragma solidity ^0.4.23;

contract AssetFactory {
    Asset[] deployedAssets;

    function createAsset(string name) public returns (Asset) {
        Asset newAsset = new Asset(name);
        deployedAssets.push(newAsset);
        return newAsset;
    }

}

contract Asset {
    string name;

    constructor(string _name) public {
        name = _name;
    }

    function modifyAssetAndCreateNew(string _name, AssetFactory factory) public {
        factory.createAsset(_name);
        name = _name;
    }
}
