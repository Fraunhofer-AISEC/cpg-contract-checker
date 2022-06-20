  function printAddresses() public returns(addrToValue[] memory){
        addrToValue[]  memory addressesArray;    

        for(uint256 _ssArrIndex=0; _ssArrIndex<simpleStorageArray.length; _ssArrIndex++){
            addrToValue memory addressTov;
            addressTov.addr = address(simpleStorageArray[_ssArrIndex]);
            addressTov.value = SimpleStorage(address(simpleStorageArray[_ssArrIndex])).retrieve();
            addressesArray.push(addressTov);
            
        }
        return addressesArray;
    }
