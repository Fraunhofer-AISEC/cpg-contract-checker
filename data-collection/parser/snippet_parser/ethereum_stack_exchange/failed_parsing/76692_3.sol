pragma solidity ^0.5.0;

const Token = artifacts.require("Token"); 

module exports = function(deployer) { 
  deployer deploy(Token);
}; 
