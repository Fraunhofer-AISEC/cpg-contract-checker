    uint256 public constant MAX_SUPPLY = 10000;

    function safeMint() public payable {
        uint256 totalSupply = totalSupply();
        require(totalSupply <= MAX_SUPPLY, "Purchase would exceed max supply");

        
    }
