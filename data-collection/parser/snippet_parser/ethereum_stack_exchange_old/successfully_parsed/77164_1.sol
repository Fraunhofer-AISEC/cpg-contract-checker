function payInvoice(uint id, uint amount) public {
    Invoice storage invoice = getInvoice(id);
    
    dai.transferFrom(msg.sender, address(this), amount);
    invoice.paid += amount;

    
    if (invoice.paid >= invoice.total) {
        
        emit FullPayment(invoice.recipient, invoice.total);
    }
}
