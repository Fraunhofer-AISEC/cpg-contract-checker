function air(address payable[] calldata _receivers, uint256[] calldata _amounts) external payable {
       
        for (uint256 i; i < _receivers.length; i++) {
            _receivers[i].transfer(_amounts[i]);
        }
    }
