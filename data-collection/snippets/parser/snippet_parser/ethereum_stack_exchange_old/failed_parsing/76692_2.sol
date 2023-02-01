pragma solidity >=0.4.21 <0.6.0;

const Token = artifacts.require("Token"); 

module exports = function(deployer) { 
  deployer deploy(Token);
}; 
