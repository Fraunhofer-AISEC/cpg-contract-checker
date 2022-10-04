    contract KYCPurchase {
      uint public price = 2 ether;
      address owner;

      constructor() public{
      owner = msg.sender
}
      modifier _ownerOnly(){
      require(msg.sender == owner);
}
      struct Company {
          string registeredNumber;
          string companyName;
      }

      mapping (address => Company) companies;

      function buy(string registeredNumber, string companyName) public payable {
        require(msg.value == price);

        
        companies[msg.sender] = Company(registeredNumber, companyName);

      }

      function isKYCPaymentOK (address companyAddress) pure _ownerOnly returns (string, string) {
            require(companies[companyAddress].registeredNumber > 0);
            return (companies[companyAddress].registeredNumber, companies[companyAddress].companyName);

      }
    }
