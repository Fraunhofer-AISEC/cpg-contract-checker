uint purchase_id = purchases.length++;
purchases[purchase_id].product_id = product_id;
purchases[purchase_id].complete   = false;
purchases[purchase_id].payments.push(Payment(msg.sender, amt));
