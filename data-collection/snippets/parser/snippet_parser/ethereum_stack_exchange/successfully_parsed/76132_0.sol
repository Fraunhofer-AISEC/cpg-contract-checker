contract WhitelistAdvanced {
    Whitelist internal whitelistContract = Whitelist(0x6198149b79AFE8114dc07b46A01d94a6af304ED9);

    constructor() public {
        address[] memory subscriberList = whitelistContract.getSubscriberList();
        for (uint256 i = 0; i < subscriberList.length; i++) {
            _subscribe(subscriberList[i]);
        }
    }
}