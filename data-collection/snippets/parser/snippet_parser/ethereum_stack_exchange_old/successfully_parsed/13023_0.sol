pragma solidity ^0.4.9;


contract Trading {

    address receivingAccount;
    uint deadline;

    struct Asset {
        string name;
        uint price;
        uint barcode;
    }

    struct Stock {
        Asset asset;
        uint count;
    }

    struct Vendor {
        string name;
        address account;
        Stock[] stocks;
    }

    Asset[] assets;
    Vendor[] vendors;

    
    function Trading(address _vendor0, address _vendor1) {
        
        assets.push(Asset("Asset0", 12, 1234));
        Asset memory asset1 = Asset("Asset1", 34, 5678);
        assets.push(asset1);

        
        Vendor memory vendor0 = Vendor("Vendor0", _vendor0, new Stock[](5));
        Vendor memory vendor1 = Vendor("Vendor1", _vendor1, new Stock[](5));

        
        vendor0.stocks[0] = Stock(assets[0], 2);
        vendor0.stocks[1] = Stock(assets[1], 2);
        vendors.push(vendor0);

        
        vendor1.stocks[0] = Stock(assets[0], 1);
        vendor1.stocks[1] = Stock(assets[1], 1);

        
        deadline = now + 10 * 1 minutes;
    }  

    function listAssetBarcodes() constant returns (uint[]) {
        uint[] memory barcodes = new uint[](assets.length);
        for (uint i=0; i<assets.length; i++) {
            barcodes[i] = assets[i].barcode;
        }
        return barcodes;
    }

    modifier afterDeadline() { if (now >= deadline) _; }

    
    function dispose() afterDeadline {
        suicide(receivingAccount);
    }
}
