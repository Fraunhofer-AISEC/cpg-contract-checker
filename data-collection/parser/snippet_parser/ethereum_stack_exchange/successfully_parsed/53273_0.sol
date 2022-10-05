pragma solidity ^0.4.22;

contract Purchase {

 address public buyer;
 address public seller;
 address public companyEscrow;
 uint private moneyInEscrow = 0;

 modifier onlyCompanyEscrow {
    require(
        msg.sender == companyEscrow,
        "Only the escrow account of the company can call this function."
    );
    _;
 }

 modifier onlyBuyer {
    require(
        msg.sender == buyer,
        "Only the buyer can call this function."
    );
    _;
 }

 constructor (address addressSeller, address addressCompanyEscrow) public payable {
    buyer = msg.sender;
    seller = addressSeller;
    companyEscrow = addressCompanyEscrow;
 }

 function sendFundsToCompany ()
      public
      payable
      onlyBuyer
      returns (bool completed)
  {
      moneyInEscrow = msg.value;
      companyEscrow.transfer(moneyInEscrow);
      return true;
  }


  function sendFundsToSeller ()
      public
      payable
      onlyCompanyEscrow
      returns (bool completed)
  {
      seller.transfer(moneyInEscrow);
      moneyInEscrow = 0;
      return true;
  }
}
