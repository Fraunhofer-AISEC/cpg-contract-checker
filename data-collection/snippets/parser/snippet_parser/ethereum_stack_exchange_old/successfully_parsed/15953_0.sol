contract ethertransfer {    
  function fundtransfer(address etherreceiver, uint256 amount) {
    if(!etherreceiver.send(amount)) {
       throw;
    }
  }
}

contract etherreceiver {

  function etherreceiver() {      
  }
}
