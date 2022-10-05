function deleteAsset(uint assetId) external returns(uint) {
        bool assetFound = false;
        
        if (allUsers[msg.sender].assets[allUsers[msg.sender].assets.length - 1] == assetId){
            assetFound = true;
        }

        else{
            
            for (uint i = 0; i < allUsers[msg.sender].assets.length - 1; i++) {
                if (!assetFound && allUsers[msg.sender].assets[i] == assetId)
                    assetFound = true;

                if(assetFound)
                    allUsers[msg.sender].assets[i] = allUsers[msg.sender].assets[i + 1];
            }
        }

        if (assetFound){
            delete allUsers[msg.sender].assets[allUsers[msg.sender].assets.length - 1];
            allUsers[msg.sender].assets.length--;
        }
    }
