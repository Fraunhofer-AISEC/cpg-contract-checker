 pragma solidity ^0.8.0;
 interface IGenerator{
     function owner() external view returns (address);
     function matchGenerated() external view returns (string)
 }
