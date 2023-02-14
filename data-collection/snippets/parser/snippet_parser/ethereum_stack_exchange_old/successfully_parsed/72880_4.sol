pragma solidity ^0.5.0;

    contract firstCoin{

address deployer; 
mapping(address=>uint) balances;  

constructor() public {
    deployer = msg.sender;  
}



function giveCoin(uint amount,address receiver) public
{
  if(msg.sender == deployer){

    balances[receiver] += amount;

  }
  else{
    revert(); 
  }
}

function viewBalance() public view returns (uint)
{
  return balances[msg.sender];
}
}
