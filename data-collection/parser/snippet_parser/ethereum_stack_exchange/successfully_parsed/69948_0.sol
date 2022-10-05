pragma solidity ^0.4.9;

contract Asset {

    address public owner;
    struct Asset {
        string title;
        string description;
        uint  assetTime;
        uint price;
    }

    Asset[] public  assets;

    event LogAssetAdded(address indexed fromAddress, string description);

    
    function addAsset(string  description1, string title1, uint price1,uint assetTime1) 
      returns (uint, string, string, uint, uint) {
        uint assetID = assets.length++;
        Asset o = assets[assetID];

        o.description = description1;
        o.assetTime=assetTime1;
        o.title = title1;
        o.price = price1;

        LogAssetAdded(msg.sender, description1);

        return (assetID, assets[assetID].description, assets[assetID].title, assets[assetID].price, 
          assets[assetID].assetTime);
    }

    
    function assetCount() public constant returns(uint) {
        uint assetCount =assets.length;
        return(assetCount);
    }

    function getAssetPrice(uint assetID) public constant returns(uint) {
        return assets[assetID].price;
    }

    function getDefAssetPrice() public constant returns(uint) {
        return assets[assets.length-1].price;
    }

    function getDefAssetTitle() public constant returns(string) {
        return assets[assets.length-1].title;
    }

    function getDefAssetTime() public constant returns(uint) {
        return assets[assets.length-1].assetTime;
    }
}
