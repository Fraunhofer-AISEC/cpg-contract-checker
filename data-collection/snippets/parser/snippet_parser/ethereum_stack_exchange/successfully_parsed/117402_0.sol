pragma solidity ^0.8.0;

contract Bakery {

  

  address[] public contracts;
  Cookie public cookieContract;

  function getContractCount() 
    public
    
    returns(uint contractCount)
  {
    
  }

  

  function newCookie(string memory _name)
    public
    returns(Cookie newContract)
  {
    newContract = new Cookie(_name);
    contracts.push(newContract);   
    return newContract;
  }

  function getCookieName (Cookie _cookieContract) public returns(string memory name) {
      cookieContract = _cookieContract;
      string memory n =  cookieContract.name();
      return n;
  }
}


contract Cookie {

    
    string public name;

     constructor (string memory _name) public{
        name = _name;
    }

  

  function getFlavor()
    public
    pure
    returns (string memory flavor)
  {
    return "mmm ... chocolate chip";
  }    
}```
