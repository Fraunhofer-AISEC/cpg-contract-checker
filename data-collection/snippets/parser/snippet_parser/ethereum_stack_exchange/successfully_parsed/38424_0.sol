contract EthBooking {
    function addBooking(uint listingId) public payable returns(uint bookingId) {
    bookingId =  BookingLibrary.book(ethDB, listingId, msg.sender, msg.value);

    
    return bookingId;
}
}
