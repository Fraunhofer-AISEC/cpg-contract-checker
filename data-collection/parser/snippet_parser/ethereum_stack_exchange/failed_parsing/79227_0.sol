modifier dataNotStored(uint256 _index) {
        require( keccak256(abi.encodePacked(storedData[_index])) == keccak256(abi.encodePacked('')) );
        _;
    }

    function set(uint _index, string calldata _data_to_store) external dataNotStored(_index) {
        storedData[_index] = _data_to_store;
    }
