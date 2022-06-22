function withdrawInvoice(uint id, uint amount) public {
    Invoice storage invoice = getInvoice(id);
    if (invoice.paid >= invoice.total) {
        
        dai.transfer(invoice.recipient, invoice.total);
    }
}
