
pragma solidity >=0.8.0 <0.9.0;

import "Contract_B.sol";
import "Token.sol";

contract Contract_A{

  Contract_B public contract_B;
  Token public token;

   constructor(Contract_B _contract_B, Token _token){
      contract_B =  Contract_B(_contract_B);
      token = Token(_token);
       
    }

    function call_b() public returns(bool){
      
      uint costToUse = b.costToUse;
      require(token.balanceOf(address(msg.sender)) >= costToUse ,"You don't have enough!");
      require(token.allowance(address(msg.sender), address(this)) >= costToUse , "Allowance to 
      low");

      

      
      require(b.f(msg.sender), "failed!");

      require(token.transferFrom(address(msg.sender), address(this), costToUse ), "Transfer 
      Error");
    }

}

contract Contract_B{
  
  
  Contract_A public contract_A;
  
  bool public continue;
  uint public costToUse;
  uint public userCount;
  mapping(uint => address) users;
  
  constructor(Contract_A _contract_A, uint _costToUse){
    contract_A = new(_contract_A); 
    costToUse = _costToUse;
    continue = true;
  }

  modifier onlyA(){
      require(msg.sender == contract_A, "not contract A!");  
    _;
  }
  
  function f(address _user) public onlyA() returns (bool){
    require(continue , "Can not continue");
    users[userCount] = _user;
    userCount++;
    return true;
  }
   
  function setContinue(bool _continue) public onlyA() returns(bool){
      continue= _continue;
      return true;
  }


}
