pragma solidity >=0.4.18 <0.5.13;

contract KYC {
   struct Customer { 
      string userName;
      string customerData;
      address Bank;
   }
   mapping (address => Customer) customers;
   address[] public customersArray;
   
 struct Bank { 
      string Name;
      address ethAddress;
      string regNumber;
   }
   mapping (address => Bank) bank;
   address[] public banksArray;
   
   
    function addCustomer (address _address, string memory _userName, string memory _customerData, address _bank) public {
        Customer storage customer = customers[_address];
        
        customer.userName=_userName;
        customer.customerData=_customerData;
        customer.Bank=_bank;
        
        customersArray.push(_address) -1;
    }
    
   function getCustomer(string memory uName) view public returns (string memory) {
        Customer storage customer = customers[uName];
        return customer.customerData;
    }
   
}
