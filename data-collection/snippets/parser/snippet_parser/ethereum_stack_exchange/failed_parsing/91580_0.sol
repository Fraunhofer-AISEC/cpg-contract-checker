pragma ^0.7.0;

interface ERC20 {
  
}
contract MyContract () {
  address erc20Contract;
  uint256 value;

  constructor (address _erc20) {
    ERC20 token = ERC20(_erc20); 
    erc20Contract = _erc20;
    
    value = msg.value; 
  }
}
