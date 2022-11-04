

pragma solidity ^0.8.0;

contract StackOverflowAnswer {

  struct Ticket {
        uint id;
        uint[] numbers;
        address payable owner;
  }
  mapping(uint => mapping(address => Ticket)) public entries;

  function enter(uint256[] memory userNumbers, uint id) public {

    Ticket memory newTicket = Ticket(
        id,
        userNumbers,
        payable(msg.sender)
    );
    
    entries[id][msg.sender] = newTicket;
  }

  function seeTicket(uint id, address _address) public view returns (uint[] memory) {
    return entries[id][_address].numbers;
  }
}
