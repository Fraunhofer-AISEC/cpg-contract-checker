  struct Payment {
    address maker;
    uint amount;
  }

  struct Purchase {
    uint product_id;
    bool complete;
    Payment[] payments;
  }
  Purchase[] purchases;

  function makePayment(uint product_id, uint amt, uint purchase_id) returns (bool) {

      Payment[] payments;
      payments[0] = Payment(address, amt);
      purchases[purchase_id] = Purchase(product_id, false, payments);
  }
