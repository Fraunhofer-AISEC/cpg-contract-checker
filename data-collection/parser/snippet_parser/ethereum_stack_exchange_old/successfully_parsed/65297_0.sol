    
    mapping(bytes32 => address) public tokens;

    
    function addNewToken(bytes32 symbol_, address address_) public onlyOwner returns (bool) {
        tokens[symbol_] = address_;

        return true;
    }

    
    function removeToken(bytes32 symbol_) public onlyOwner returns (bool) {
        require(tokens[symbol_] != 0x0);

        delete(tokens[symbol_]);

        return true;
    }
