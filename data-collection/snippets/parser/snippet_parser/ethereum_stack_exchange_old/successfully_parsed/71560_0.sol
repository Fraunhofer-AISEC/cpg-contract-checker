

bytes4 private constant _INTERFACE_ID_ERC721_METADATA = 0x5b5e139f;

constructor (string memory name, string memory symbol) public {
  _name = name;
  _symbol = symbol;

  
  _registerInterface(_INTERFACE_ID_ERC721_METADATA);
}

