contract mycontract {
      
    uint sender;
    uint transactiondate;
    uint dueDate;
    uint counter;
    
    struct myStruct {
        uint amount;
        address sender;
        uint transactiondate;
        uint dueDate;
    }
    
    myStruct[] public invoices; 
    
    mapping(address => myStruct[]) public userInvoices;
    
   
    function addInvoice (uint amount, uint _dueDate) public {
        transactiondate = block.timestamp;
        dueDate = block.timestamp + (_dueDate * 1 days);
        userInvoices[msg.sender].push(myStruct(amount, msg.sender, transactiondate, dueDate));
        myStruct memory invoiceData = myStruct(amount, msg.sender, transactiondate, dueDate);
        invoices.push(invoiceData);
    }
    
    function getInvoices() public view returns(myStruct[] memory) {
        return invoices;
    }
    
   function getArrayLength() public view returns(uint) {
       uint arrayLength = invoices.length;
       return arrayLength;
   }
   
   function showUserInvoices() public view returns (myStruct[] memory) {
       return userInvoices[msg.sender];
   }
    
  
    
    
    function loopInvoices() public view returns(string memory) {
        uint arrayLength = invoices.length;
        for (uint i=0; i<arrayLength; i++) {
            if (block.timestamp <= invoices[i].dueDate) {
                return 'Invoice not due yet';
            } 
        }
    }

    
}
