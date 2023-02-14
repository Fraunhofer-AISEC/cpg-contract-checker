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
          address companyAddress;
          string companyName;
      }

      mapping (string => Company) companies;

      function buy(string registeredNumber, string companyName) public payable {
        require(msg.value == price);

        
        companies[registeredNumber] = Company(msg.sender, companyName);

      }

      function isKYCPaymentOK (string _registeredNumber) pure _ownerOnly returns (string, string) {
            require(companies[_registeredNumber].companyAddress != address(0));
            return (companies[companyAddress].registeredNumber, companies[companyAddress].companyName);

      }
    }
