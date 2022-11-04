    function mint(uint256 _quantity) external payable {
        require(totalSupply() < MAX_SUPPLY, "SOLD OUT");
        require(totalSupply() + _quantity <= MAX_SUPPLY, "SOLD OUT");
        
        
        require(_quantity > 0, "AMOUNT CANNOT BE ZERO");
        require(_quantity <= MAX_PER_TX, "AMOUNT EXCEEDED PER TXN");
        require(msg.value == (_quantity * PRICE), "PRICE LIMIT NOT REACHED");
        for (uint256 i=0; i<=_quantity; i++) {
            uint256 currentToken = uint256(totalSupply()) + 1;
            _safeMint(msg.sender, currentToken);
            _totalClaimed[msg.sender] += 1;
            
            
        }
    }
