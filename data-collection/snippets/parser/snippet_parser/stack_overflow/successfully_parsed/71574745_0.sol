
  pragma solidity 0.8.12;

  contract MyContract {

 address payable public myaddress;

 struct TUser {
   uint totalInvested;
   uint totalDeposits;
 } 

 mapping( address => TUser ) public USERS;

 constructor(address payable _walletProject) {

     myaddress = _walletProject;


 }

 receive() payable external {
 }

function newDeposit(uint _amount) public returns(uint,uint){
 USERS[msg.sender].totalDeposits += 1;
 USERS[msg.sender].totalInvested += _amount;
 return (USERS[msg.sender].totalDeposits, USERS[msg.sender].totalInvested);
}


 function getUserinfo (address _sender) public view returns (uint, uint) {
 return (USERS[_sender].totalDeposits, USERS[_sender].totalInvested); 
  }

 }
