contract MultiplyContract{
    address public sender;
    address public receiver;
    uint public price;
    function MultiplyContract(
      address _sender,
      address _receiver,
      uint _price
      ){
      sender = _sender;
      receiver = _receiver;
      price = _price;
    }
    function Execution(){
      
    }
    function () {
      throw;
    }
}
