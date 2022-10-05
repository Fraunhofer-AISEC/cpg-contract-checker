 `pragma solidity ^0.4.25;

  contract MyContract {

  address Owner1;
  address Owner2;
  address Wallet;
  mapping(address => bool) signed;
  mapping(address => uint) balances;

  constructor() public payable {
   Owner1 = 0xC20201d915458EF540aDe6068dFe2777E8fa733c;
   Owner2 = 0x54201A09ACff6D2A60DcdF8896AFf308FDDC160C;
   Wallet = 0x30E09Fa68430Def6978ED1a3E8f5ed473A04024c;
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
   signed[Oener2] = false; 
   }
     }
