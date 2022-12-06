    function refundAmount(address payable _customer)
                      external
                      payable {
    if(registrations[_customer].amount > 0){
        if(address(this).balance >= registrations[_customer].amount) {

            ticketsSold = ticketsSold - registrations[_customer].noOfTickets;
            registrations[_customer].noOfTickets = 0;
            registrations[_customer].email = " ";
            uint refundCustAmount = registrations[_customer].amount;
            registrations[_customer].amount = 0;
            
            _customer.transfer(refundCustAmount);
            
            emit Refund(_customer, refundCustAmount);
    }

}
}