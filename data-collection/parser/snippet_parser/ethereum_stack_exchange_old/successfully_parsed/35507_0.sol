pragma solidity ^ 0.4.8;

contract AssetManagement {
    struct Asset {
    uint assetId;
    string assetCode;
    string assetName;
    string serviceTag;
}

    mapping (uint=>Asset) assetList;
    event onAddNewAsset(uint assetId,string assetCode,string assetName,string serviceTag);
    event onAssetAssignment(uint assetId,string assetName,uint userId,string userName);
    event onAssetReturn(uint assetId,string assetName,uint userId);
    event onGetAssignemnt(uint[] assetIds);

    
    mapping(uint => uint[]) userAssets;
    
    uint[] assetsArray;
    
    Asset asset;
    string assetNameToLog;


    function createNewAsset(uint assetId,string assetCode,string assetName,string serviceTag) public{
       asset.assetId=assetId;
       asset.assetCode=assetCode;
       asset.assetName=assetName;
       asset.serviceTag=serviceTag;
       assetList[assetId]=asset;
       onAddNewAsset(assetId,assetCode,assetName,serviceTag);
    }

    function assignAsset(uint userId, uint assetId, string userName)public {
        
        assetsArray=userAssets[userId];

        assetsArray.push(assetId);
        userAssets[userId]=assetsArray;
        assetNameToLog=assetList[assetId].assetName;
        onAssetAssignment(assetId,assetNameToLog,userId,userName);
    }

    function returnAsset(uint userId, uint assetId)public {
        
        assetsArray=userAssets[userId];

        uint index=IndexOf(assetsArray,assetId);
        if(index>0){
        delete assetsArray[index-1];
        userAssets[userId]=assetsArray;
        assetNameToLog=assetList[assetId].assetName;
        onAssetReturn(assetId,assetNameToLog,userId);
        }
    }

    function getAssetAssignment(uint userId)public returns (uint[] assetIds) {
        assetIds=userAssets[userId];
        onGetAssignemnt(assetIds);
    }

    function IndexOf(uint[] values, uint value)public returns(uint) {
        uint length=values.length;
        uint i = 0;
            while (values[i] != value) {
              i++;
              if(i==length){
                  return 0;
              }
            }
        return i+1;
    }
}
