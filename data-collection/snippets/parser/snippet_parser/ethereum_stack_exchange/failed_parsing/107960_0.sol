pragma '0.7.0';


contract Hello {
  address private privadd = 0x5B38Da6a701c568595dCfcB03FcB875f56beddCA

  constructor () {
    require(msg.sender != privadd, "sender can not be private address"); 
    
  }
}
