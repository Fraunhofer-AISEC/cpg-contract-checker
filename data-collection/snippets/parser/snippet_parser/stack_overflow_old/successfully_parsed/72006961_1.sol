    constructor () public {
        
        _registerInterface(_INTERFACE_ID_ERC721);
        _registerInterface(_INTERFACE_ID_ERC721_METADATA);
        _registerInterface(_INTERFACE_ID_ERC721_ENUMERABLE);
    }

     function name_symbol(string memory nameNFT,string memory symbolNFT) internal virtual{
         _name = nameNFT;
        _symbol = symbolNFT;
    }
