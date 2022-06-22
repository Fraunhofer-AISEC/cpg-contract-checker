mapping (bytes32 => Receipts[]) receiptsByPersonMap;
Receipts[] dummyReceiptsList;

Receipts newReceipt = new Receipts(_person, _cost);

dummyReceiptsList = receiptsByPersonMap[_person];

dummyReceiptsList.push(newReceipt);
receiptsByPersonMap[_person] = dummyReceiptsList;
