pragma solidity ^0.4.2;

contract SimpleStorage {
  mapping(address => Pass[]) passes; 

  struct Pass{
      string class_name;
      string first_name;
      string last_name;
  }

  function submitPass(string classname, string firstname, string lastname){
      passes[msg.sender].push(Pass({
          class_name: classname,
          first_name: firstname,
          last_name:  lastname
      }));
  }

}
