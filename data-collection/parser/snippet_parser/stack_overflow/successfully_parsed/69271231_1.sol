 
 pragma solidity ^0.8.0;

 import "@openzeppelin/contracts/finance/PaymentSplitter.sol";

 contract MyNFTContract is PaymentSplitter {
     
     address[] private _CSPayees = [
         0x23377d974d85C49E9CB6cfdF4e0EED1C0Fc85E6A,
         0x85F68F10d3c13867FD36f2a353eeD56533f1C751
     ];
     
     uint256[] private _CSShares = [1, 2];

     constructor() PaymentSplitter(_CSPayees, _CSShares) {}
 }
