    struct NewPrice{
        address asset;
        uint256 timestamp;
        uint256 price;
    }

    function updatePrices(NewPrice[] memory _array) public onlyRole(FEEDER_ROLE) {
        for(uint256 i=0; i<_array.length; i++){
            address asset = _array[i].asset;
            uint256 timestamp = _array[i].timestamp;
            uint256 price = _array[i].price;
            putPrice(asset, timestamp, price);
        }
    }
