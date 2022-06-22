  function create(address _sender, address _receiver)  external payable 
   {
            _sender = _sender;
            _receiver = _receiver
            _expiry = block.timestamps + 100;
            number = number + 1;
            Created(0x01);
    }

  function accept(address _receiver,uint32 _value) external {
     require(_expiry > block.timestamps);
     _receiver.transfer(_value);
  }

  function refund(){

  }
