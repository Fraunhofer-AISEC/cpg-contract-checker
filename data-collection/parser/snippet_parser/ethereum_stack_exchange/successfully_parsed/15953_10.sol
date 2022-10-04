contract ethertransfer {    
  function fundtransfer(address etherreceiver, uint256 amount) public payable {
    if(!etherreceiver.transfer(amount)) {
       throw;
    }
  }
}

contract etherreceiver {

  function etherreceiver() external payable{      
  }
}
