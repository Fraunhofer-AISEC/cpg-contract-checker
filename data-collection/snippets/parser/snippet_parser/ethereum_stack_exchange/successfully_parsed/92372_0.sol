    constructor (string memory name, string memory symbol) public {
    _name = name;
    _symbol = symbol;

    _registerInterface(_INTERFACE_ID_ERC721);
    _registerInterface(_INTERFACE_ID_ERC721_METADATA);
    _registerInterface(_INTERFACE_ID_ERC721_ENUMERABLE);
}
