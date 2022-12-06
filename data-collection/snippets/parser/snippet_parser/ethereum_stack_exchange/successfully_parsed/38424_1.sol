library BookingLibrary {

function book(address db, uint listingId, address sender, uint value) 
        internal returns (uint bookingId) 
{
    var cost = ListingLibrary.getCost(db,listingId);
        
        EthWallet wallet = new EthWallet();
        
        wallet.receiveFunds.value(cost);
    return bookingId;
}
}