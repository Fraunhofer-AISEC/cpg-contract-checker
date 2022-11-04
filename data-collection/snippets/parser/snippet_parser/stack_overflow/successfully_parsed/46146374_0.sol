pragma solidity ^0.4.2;

contract SimpleStorage {
  mapping(address => EventClass[]) class_event; 

  struct EventClass {
      uint start_time;
      string title;
      string first_name;
      string last_name;
  }

  function registerTicket(){
    class_event[msg.sender][0].first_name = "Alain";
  }
}
