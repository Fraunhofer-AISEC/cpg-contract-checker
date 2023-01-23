contract ERC721UpgradeableV1 is Initializable, ERC721Upgradeable, ERC721URIStorageUpgradeable, UUPSUpgradeable {

    ...

    constructor() {
        _disableInitializers();
    }

    function initializeERC721UpgradeableV1(string memory _name, string memory _symbol, string memory uri, address witness ) initializer public {
        __ERC721_init(_name,_symbol);
        __ERC721URIStorage_init();
        __UUPSUpgradeable_init();
        baseURI = uri;
        admin721  = msg.sender;
        witness721 = witness;
        isPaused = true;
        isWhitelistOnly = true;
    }

    function _authorizeUpgrade(address newImplementation) internal override {
        require(msg.sender == admin721 || msg.sender == witness721);        
    }

    ....

}


contract PaymentSplitterUpgradeable is Context, ReentrancyGuard, Initializable, UUPSUpgradeable {

    ...


    
    function initializePaymentSplitter( address witness_, address[] memory payees, uint256[] memory shares_) payable public initializer {
        require(payees.length == shares_.length, "PaymentSplitterUpgradeable: payees and shares length mismatch");
        require(payees.length > 0, "PaymentSplitterUpgradeable: no payees");
        paymentWitness = witness_;
        paymentOwner = msg.sender;
        _addPayoutWindow( payees, shares_);
    }


    function _authorizeUpgrade(address newImplementation) internal override {
        require(msg.sender == paymentOwner || msg.sender == paymentWitness);
    }

}
