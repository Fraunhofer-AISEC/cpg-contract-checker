    address[] memory _address;

    uint256 count = 0;

    for (uint i = 0; i < deposit_request.length; i++){
        if (deposit_request[i]._confirmed){
            ++count;
        }
    }

    _address = new address[](count);
