contract pay {

  uint amount;
  function payment(uint _amount, address payable _ID) external payable {
        
        amount = _amount;
        _ID.transfer(msg.value);
    }
}
