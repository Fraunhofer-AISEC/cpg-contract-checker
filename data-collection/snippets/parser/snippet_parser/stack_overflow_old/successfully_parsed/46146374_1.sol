pragma solidity ^0.4.2;

contract SimpleStorage {
  mapping(address => Pass[]) passes; 

  struct Pass {
      string first_name;
      string last_name;
  }

  function submitPass(){
      passes[msg.sender].push(Pass({
          first_name: "Alain",
          last_name: "Goldman"
      }));
  }

  function whatsInFirst() returns(string){
      return passes[msg.sender][1].first_name;
  }
}
