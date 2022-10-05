contract KYCPurchase {
  uint public price = 2 ether;

  struct Company {
      string registeredNumber;
      string companyName;
  }

  mapping (address => Company) companies;

  function buy(string registeredNumber, string companyName) public payable {
    require(msg.value == price);

    
    companies[msg.sender] = Company(registeredNumber, companyName);

  }

  function isKYCPaymentOK (string registeredNumber, string companyName) pure private returns (string, string) {
        return (registeredNumber, companyName);

  }
}
