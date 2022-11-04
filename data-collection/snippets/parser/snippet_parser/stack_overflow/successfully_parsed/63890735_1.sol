pragma solidity ^0.4.25;

  contract MyContract {

  address Owner1;
  address Owner2;
  address Wallet;
  mapping(address => bool) signed;
  mapping(address => uint) balances;

  constructor() public payable {
   Owner1 = 0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB;
   Owner2 = 0x583031D1113aD414F02576BD6afaBfb302140225;
   Wallet = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;
   }
   
   function deposit() payable returns(bool success) {
        balances[msg.sender] +=msg.value;
        return true;
    }

   function Sign() public {
   require (msg.sender == Owner1 || msg.sender == Owner2);
   require (signed[msg.sender] == false);
   signed[msg.sender] = true;
    }

   function Reward() public payable returns (string) {
   require (signed[Owner1] == true && signed[Owner2] == true);
   Wallet.transfer(1 ether); 
   signed[Owner1] = false; 
   signed[Owner2] = false; 
   }
     }
