constructor(
    string memory name,
    string memory symbol,
    string memory baseTokenURI
) ERC721(name, symbol) {
    _baseTokenURI = baseTokenURI;

    _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

    _setupRole(MINTER_ROLE, _msgSender());
    _setupRole(PAUSER_ROLE, _msgSender());
}
