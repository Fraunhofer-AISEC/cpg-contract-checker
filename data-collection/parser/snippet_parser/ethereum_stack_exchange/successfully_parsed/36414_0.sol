function getAllLandForSale() external returns(uint256[]){

        uint[] memory propertiesForSaleArray;

        
        uint256 totalNumberOfProperties = baseContract.getLandArrayLength();

        for(uint i = 0; i < totalNumberOfProperties; ++i) {

           address currentOwner = baseContract.getLandOwner(i);

           if(currentOwner == address(0)){

               propertiesForSaleArray.push(i);

           }

        }
    }
