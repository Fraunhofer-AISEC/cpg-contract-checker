  modifier validOwner() {
    require(msg.sender == _owner);
    _;
  }

  function transferToMany(address[] memory receivers, uint[] memory amounts, address token)
    validOwner
    public
      {
    require(receivers.length == amounts.length);
    uint totalAmount = 0;

    for(uint i = 0; i < receivers.length; i++){
         totalAmount += amounts[i];
     }
     require(address(this).balance >= totalAmount);

    for(uint i = 0; i < receivers.length; i++) {
      if(token != 0x0000000000000000000000000000000000000000) {
        erc20iface =  ERC20(token);
        erc20iface.transfer(receivers[i], amounts[i]);
     } else {
        (bool result, ) = receivers[i].call.value(amounts[i])("");
        if(!result) revert();
     }
    }
  }
