   function createSmartWallet(
        uint256 _smartWalletId,
        address _defaultAdmin,
        string memory _name,
        string memory _symbol,
        string memory _contractURI,
        address[] memory _trustedForwarders,
        address _royaltyRecipient,
        uint256 _royaltyBps
    ) public {
        SmartWalletProxy smartWallet = new SmartWalletProxy(address(proxy), address(this), abi.encodeCall(SmartWallet(payable(address(0))).initialize, (_defaultAdmin, _name, _symbol, _contractURI, _trustedForwarders, _royaltyRecipient, _royaltyBps)));
        smartWallets[_smartWalletId] = address(smartWallet);
    }
