function addManufacturerData(uint[] memory _farmerIds, string memory _name,
 string memory _date) public {

     items.length++;
     Item storage tempItem = items[items.length-1];
     for(uint i = 0 ; i<_farmerIds.length; i++){
         tempItem.farmers.push(globalFarmers[_farmerIds[i]]);
     }

     tempItem.manufacturerName = _name;
     tempItem.manufacturerDate = _date;

}

