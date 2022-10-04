function initialize(
    string memory _baseURIMetadata,
    bytes32 _merkleRoot,
) public initializer {
    __ERC721_init("XXX", "XXX");
    __ERC721Enumerable_init();

    __AccessControl_init();

    _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);        
    _grantRole(STARDUST_CONTRACTS_ROLE, _boxContract);

    baseURI = _baseURIMetadata;
    merkleRoot = _merkleRoot;
}
