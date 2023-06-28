    mapping(uint256 => uint256) private _nextId;
    uint256 private _lastPublicId;
    
    function holderMint(uint256 _id) public {
        _checkValid(_id);   
        
        _nextId[_id-1] = nextId(_id);  
        
        _safeMint(msg.sender, _id);   
    }
    
    function publicMint() public {
        uint256 _id = nextPublicTokenId();
        require(_id <= MAX_NFT_SUPPLY, "All tokens have been minted");
        
        _lastPublicId = _id;
        
        _safeMint(msg.sender, _id);
    }
    
    function nextPublicTokenId() public view returns(uint256) {
        return nextId(_lastPublicId);
    }
    
    function nextId(uint256 _id) public view returns(uint256) {
        uint256 _next = _nextId[_id];
        if (_next == 0) {
            return _id+1;  
        } else {
            return _next;
        }
    }
