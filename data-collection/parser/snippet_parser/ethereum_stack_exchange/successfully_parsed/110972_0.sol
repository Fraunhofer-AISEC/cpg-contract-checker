pragma solidity >=0.7.0 <0.9.0;

contract PaymentInvoiceSplit {
    uint productPrice;

    constructor (uint defaultProductPrice) {
        owner = msg.sender;
        productPrice = defaultProductPrice;
    }

    function payInvoice (uint invoiceId) payable public {
      
      
      
    }

    function kill () public onlyOwner() {
        selfdestruct(payable(owner));
    }
}
