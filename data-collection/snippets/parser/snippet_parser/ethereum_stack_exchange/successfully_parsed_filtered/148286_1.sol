interface ERC20 {
      function decimals() external returns (uint8); 
}

contract Proxy {
      function getDecimals(address _addr) external returns (uint8){
              return ERC20(_addr).decimals();
      }
}
