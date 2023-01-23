    mapping(uint256 => uint256) private _locks;

    function lockToken(
        uint256 targetTokenId,
        uint256 since,
    ) public {
        _locks[targetTokenId] = since;
    }
    
   function getLock(uint256 targetTokenId) public view returns (uint256) {
        return _locks[targetTokenId];
    }
