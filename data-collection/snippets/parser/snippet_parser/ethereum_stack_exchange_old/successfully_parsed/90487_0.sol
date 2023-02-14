
pragma solidity >=0.7.0;
pragma experimental ABIEncoderV2;


contract InvoiceValidator {

    mapping(uint => Invoice) private idToInvoiceMap;
    uint[] private invoicesToValidate;
    
    struct Treatment {
        string description;
        uint cost;
    }

    struct Invoice {
        address recipient;
        address sender;
        string patient;
        uint date;
        Treatment[] treatment;
    }

    constructor() {}

    function addNewInvoice(address recipient, address sender, string memory patient, uint date, Treatment[] memory treatments)
    external
    {
        uint invoiceId = 1;
        Invoice memory invoice = Invoice(recipient, sender, patient, date, treatments);
        idToInvoiceMap[invoiceId] = invoice;
        invoicesToValidate.push(invoiceId);
    }
}
