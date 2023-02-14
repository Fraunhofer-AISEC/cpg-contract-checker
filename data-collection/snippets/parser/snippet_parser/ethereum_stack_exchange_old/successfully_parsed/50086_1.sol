pragma solidity ^0.4.20;

import './Parent1.sol';

contract Child {

  
  Parent p = Parent(0x692a70d2e424a56d2c6c27aa97d1a86395877b3a);

  uint256 public totalSupply;
  mapping (address => uint256) balances;

  function getName(address addr)constant returns(string, string){
      return (p.getFName(addr), p.getLName(addr));
  }

  function addBalance(address addr){
      if (uint(keccak256(p.getFName(addr))) == uint(keccak256("a")) && uint(keccak256(p.getLName(addr))) == uint(keccak256("b"))){
          balances[addr] += (p.accountTx(addr)[p.accountTx(addr).length - 1]) * 2;
          totalSupply += (p.accountTx(addr)[p.accountTx(addr).length - 1]) * 2;

      }

      if (uint(keccak256(p.getFName(addr))) == uint(keccak256("a")) && uint(keccak256(p.getLName(addr))) == uint(keccak256("c"))){
          balances[addr] += (p.accountTx(addr)[p.accountTx(addr).length - 1]) * 3;
          totalSupply += (p.accountTx(addr)[p.accountTx(addr).length - 1]) * 3;

      }

      if (uint(keccak256(p.getFName(addr))) == uint(keccak256("a")) && uint(keccak256(p.getLName(addr))) == uint(keccak256("d"))){
          balances[addr] += (p.accountTx(addr)[p.accountTx(addr).length - 1]) * 4;
          totalSupply += (p.accountTx(addr)[p.accountTx(addr).length - 1]) * 4;

      }

      if (uint(keccak256(p.getFName(addr))) == uint(keccak256("a")) && uint(keccak256(p.getLName(addr))) == uint(keccak256("e"))){
          balances[addr] += (p.accountTx(addr)[p.accountTx(addr).length - 1]) * 5;
          totalSupply += (p.accountTx(addr)[p.accountTx(addr).length - 1]) * 5;

      }

      else {
          balances[addr] += (p.accountTx(addr)[p.accountTx(addr).length - 1]) * 6;
          totalSupply += (p.accountTx(addr)[p.accountTx(addr).length - 1]) * 6;

      }

  }

  function checkBalance(address addr) constant returns(uint){
      return balances[addr];
  }

}
