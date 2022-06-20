contract SimpleBidding {

    address contractOwnersAccount;

    
    address public client;
    uint barcode;

    
    uint expectedProposals;
    address bestVendor;
    uint bestPrice;

    
    event AssetRequested(address client, uint barcode);

    
    function SimpleBidding(address _account) {
        contractOwnersAccount = _account;
    }

    
    function dispose() {
        suicide(contractOwnersAccount);
    }

     
    function requestAsset(uint _barcode) {
        
        client = msg.sender;

        
        barcode = _barcode;

        
        AssetRequested(client, barcode);

        
        expectedProposals = 2;
        bestPrice = 999999;
    }
}
