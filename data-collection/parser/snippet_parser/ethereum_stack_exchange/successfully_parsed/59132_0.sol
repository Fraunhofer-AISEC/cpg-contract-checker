contract NewContract {
  constructor() public payable {
    
  }  
}

contract Deployer {
  function deploy() {
    address nc = new NewContract();
  }
}
