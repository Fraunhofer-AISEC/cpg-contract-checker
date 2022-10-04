contract Purchase {
  uint public amount;
  address public seller;
  address public buyer;

  function Purchase(address addr, uint _amount) {
    seller = addr;
    amount = _amount;
  }

  function confirmPurchase(address _buyer, uint val) {
    buyer = _buyer;
    if ( val == amount) {
      buyer.transfer(amount);
      seller.transfer(this.balance);
      seller.balance;
    }
  }

  function getBalance() returns (uint balance) {
    return seller.balance;
  }

  function getAddr() returns (address) {
    return msg.sender;

  }
}
