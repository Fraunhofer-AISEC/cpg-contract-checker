function batchMint(
        address _to,
        uint8 _amount,
        uint8[][] calldata _numbers
    )
        public
        onlyOwner()
        returns(uint256[] memory tokenIDs)
    {
        
        uint256[] memory amounts;
        for (uint256 i = 0; i < _amount; i++) {
            
            _tokenIDsCount.increment();
            
            tokenIDs[i] = _tokenIDsCount.current();
            
            amounts[i] = 1;

            
            stateStorageForNumbers_[tokenIDs[i]] = _numbers[i][];
        }

        
        _mintBatch(
            _to,
            tokenIDs,
            amounts,
            msg.data
        );
...
