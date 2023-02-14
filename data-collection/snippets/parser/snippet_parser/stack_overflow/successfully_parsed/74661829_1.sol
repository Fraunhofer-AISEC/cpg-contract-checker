contract ERC721PaymentSplitterV1 is 
    Initializable,
    UUPSUpgradeable,
    ERC721UpgradeableV1, 
    PaymentSplitterUpgradeable
{

    
    function initializeERC721LumoPaymentSplitter(
        string memory _name,
        string memory _symbol,
        string memory uri,  
        address witness_,
        address[] memory _payees, 
        uint256[] memory _shares
    ) initializer public {
        initializeERC721UpgradeableV1(_name, _symbol, uri, witness_);
        initializePaymentSplitter(witness_, _payees, _shares);
    } 

    function _authorizeUpgrade(address newImplementation)
        internal
        override
    {}
}
