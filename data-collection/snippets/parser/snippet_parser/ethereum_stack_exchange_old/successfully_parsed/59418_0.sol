 pragma solidity ^0.4.24;

contract smart{
event TransformToken(
    address _source,
    address _destination,
    uint amount
    );
mapping (address => uint)account;

function showToken(address _address)public view returns(uint){
 uint token=account[_address];
 return (token);

}
function addToken(address _address,uint amount)public{
 account[_address]+=amount;
 }
 function subToken(address _address,uint amount)public{
 account[_address]-=amount;
}

 function transfer(address _address,uint amount)public view returns(uint){
   addToken(_address,amount);
   subToken(msg.sender,amount);
   emit TransformToken(msg.sender,_address,amount);
   return showToken(_address);
   } 
  }
