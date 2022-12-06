   pragma solidity ^0.4.2;
   import DappToken;

    contract DappTokenSale {
       address admin;
       DappToken public tokenContract;

      function DappTokeSale(DappToken _tokenContract) public {

          admin = msg.sender;
}
    }
