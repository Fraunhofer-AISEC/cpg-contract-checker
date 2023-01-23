  struct PaymentReceipt{
    uint   start_block;
    uint   end_block;
  }
  PaymentReceipt[] paymentReceiptList;

  function verfiyPayment(uint block_start, uint block_end) returns (bool success) {
    paymentReceiptList.push(PaymentReceipt({start_block: block_start, end_block: block_end }));
    return true;
  }
