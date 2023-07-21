
    function harvestItem(
        uint _upc,
        address _originFarmerID,
        string memory _originFarmName,
        string memory _originFarmInformation,
        string memory _originFarmLatitude,
        string memory _originFarmLongitude,
        string memory _productNotes
    ) public onlyOperational {
        
        items[_upc] = Item({
            sku: sku,
            upc: _upc,
            ownerID: _originFarmerID,
            originFarmerID: _originFarmerID,
            originFarmName: _originFarmName,
            originFarmInformation: _originFarmInformation,
            originFarmLatitude: _originFarmLatitude,
            originFarmLongitude: _originFarmLongitude,
            productID: sku + _upc,
            productNotes: _productNotes,
            productPrice: 0, 
            itemState: defaultState,
            distributorID: address(0),
            retailerID: address(0),
            consumerID: address(0)
        });
        
        sku++;
        
        emit Harvested(_upc);
    }
