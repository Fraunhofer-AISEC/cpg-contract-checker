function getAllLandForSale() external view returns(uint256[]){

        
        uint256 totalNumberOfProperties = baseContract.getLandArrayLength();

        uint[] memory propertiesForSaleArray = new uint[](totalNumberOfProperties);

        for(uint i = 0; i < totalNumberOfProperties; ++i) {

            address currentOwner = baseContract.getLandOwner(i);

            if(currentOwner == address(0)){

                propertiesForSaleArray[i] = i;

            }

        }

        return propertiesForSaleArray;

    }
