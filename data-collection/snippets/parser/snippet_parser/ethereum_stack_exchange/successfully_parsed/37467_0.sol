pragma solidity ^0.4.18;

import "./TestToken.sol";


contract FactoryToken {

  

  address[] public contracts;

   mapping (address => bool) created;
  
  address newContract;


  string public  name ;
  string public  symbol ;
  uint256 public  decimals ;

  

  function getContractCount() public constant returns(uint contractCount)
  {
    return contracts.length;
  }



   function getToken() public constant returns (string,string, uint256) {
       return (name, symbol,decimals);
   }


  

 function newToken(string _name, string _symbol, uint _decimals) public returns(address objAddress){


    newContract = new WILDToken(_name,_symbol,_decimals);

    contracts.push(newContract);

    return newContract;
}

   function verify() public constant returns (address) {
        return newContract;
    }
  

   
  
}
