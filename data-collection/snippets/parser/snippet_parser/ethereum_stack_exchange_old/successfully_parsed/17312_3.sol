pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;
contract Money {
  struct People{
    uint id;
    string name;
    uint amount;
  }
  mapping (uint => People) public peoples;
  event votedEvent(uint indexed _candidateId);
  uint public candidateConut;

  constructor() public {
    candidateConut = 0;
    addCandidate("Holder 1");
    addCandidate("Holder 2");
  }
  function addCandidate(string memory _name) public {
    peoples[candidateConut] = People(candidateConut,_name,0);
    candidateConut++;
  }
  
  function get(uint _candidateId) public view returns(People memory) {
    return peoples[_candidateId];
  }
  
  function getPeople() public view returns (uint[] memory, string[] memory,uint[] memory){
      uint[]    memory id = new uint[](candidateConut);
      string[]  memory name = new string[](candidateConut);
      uint[]    memory amount = new uint[](candidateConut);
      for (uint i = 0; i < candidateConut; i++) {
          People storage people = peoples[i];
          id[i] = people.id;
          name[i] = people.name;
          amount[i] = people.amount;
      }

      return (id, name,amount);

  }
  
  function getPeoples() public view returns (People[] memory){
      People[]    memory id = new People[](candidateConut);
      for (uint i = 0; i < candidateConut; i++) {
          People storage people = peoples[i];
          id[i] = people;
      }
      return id;
  }
}
