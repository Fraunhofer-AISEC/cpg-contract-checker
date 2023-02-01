contract Nft1155Upgradeable is
    ERC1155BurnableUpgradeable,
    ERC1155SupplyUpgradeable,
    AccessControlEnumerableUpgradeable
{
    using ECDSAUpgradeable for bytes32;

   function initialize(string memory baseUri_) public initializer {
    __ERC1155Burnable_init_unchained();
    __ERC1155Supply_init_unchained();
    __AccessControlEnumerable_init_unchained();
    __ERC1155_init_unchained(baseUri_);

    _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    _setupRole(MINTER_ROLE, _msgSender());
}




}

