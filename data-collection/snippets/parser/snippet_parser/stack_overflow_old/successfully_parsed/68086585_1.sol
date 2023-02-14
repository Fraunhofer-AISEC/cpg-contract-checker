 constructor(address owner, address[] memory defaultOperators) ERC777("Shipyard", "SHIP", defaultOperators) {
        transferOwnership(owner);
        ico = address(new ShipICO(this));
        _mint(owner(), INITIAL_SUPPLY, "", "");
        _pause();
    }

