     contract theSender {

     
     address payable theReceiverContractAddress;
     theReceiverContractAddress = '0x01...'

     
     function receiverether() external payable {}

     function balanceof() { 
      return address(this).balance;
      }

     
     function debit() external{ theReceiverContractAddress.transfer(value);}

}
