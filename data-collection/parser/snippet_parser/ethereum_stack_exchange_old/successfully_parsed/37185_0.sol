pragma solidity ^0.4.11;

import "./WILDToken.sol";

contract Bakery {

  

  address[] public contracts;

  

  function getContractCount() 
    public
    constant
    returns(uint contractCount)
  {
    return contracts.length;
  }

  

  function newToken()
    public
    returns(address newContract)
  {
    WILDToken c = new WILDToken();
    contracts.push(c);
    return c;
  }
}
