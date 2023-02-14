userInvoices[msg.sender].push(myStruct(amount, msg.sender, transactiondate, dueDate));
myStruct memory invoiceData = myStruct(amount, msg.sender, transactiondate, dueDate);
invoices.push(invoiceData);
