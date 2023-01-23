contract MultiplyContract{
    address public buyer;
    address public seller;
    uint public price;
    function MultiplyContract(
      address _buyer,
      address _seller,
      uint _price,
      ){
      buyer = _buyer;
      seller = _seller;
      price = _price;
    }
    function Execution (address _buyer, address _seller) {
    eth.getBalance(_buyer) -=  price; 
    eth.getBalance(_seller) += price;
  }
}
