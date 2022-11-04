
    function addAsset(address newOwner,bytes32 description, uint cost) returns(string) {
        if (msg.sender == issuer) {
            assetCount++;
            Asset memory tempAsset = Asset(assetCount,newOwner,description,cost);
            setAssetOwnership(newOwner,assetCount,tempAsset);
            return "asset created";
    } else { 
        return "you are not the owner of contract";
    }
    }
