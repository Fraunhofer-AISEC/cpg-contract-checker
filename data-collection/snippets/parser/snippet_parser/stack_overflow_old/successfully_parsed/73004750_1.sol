function collectMaterials(address _originProducerId, string memory _originProducerName, string memory _originProducerInformation, uint _productId, string memory _productNotes, uint _productPrice) public 
{
    items[sku] = Item(
        {
            sku: sku, 
            upc: upc,
            ownerID: msg.sender, 
            originProducerID: msg.sender, 
            originProducerName: _originProducerName, 
            originProducerInformation: _originProducerInformation, 
            productId: sku + upc, 
            productNotes: _productNotes, 
            productPrice: _productPrice, 
            itemState: State.MaterialSelection, 
            consumerID: address(0)
        });
}