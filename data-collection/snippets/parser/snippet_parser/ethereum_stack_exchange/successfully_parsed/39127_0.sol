contract Payment {

    event PaymentLogger(
      address _payee,
      uint _amount,
      uint _payeeValue
      );

    

    
    
    
    

    
    
    

    function sendTo(address _payee, uint _amount) public payable {
      require(msg.value >= _amount);
      _payee.transfer(_amount);
      PaymentLogger(_payee,_amount,msg.value);
    }
}
