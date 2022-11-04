pragma solidity ^0.4.6;

contract Test {

  struct person {  
    address id;
    string name;
  }

  person[] p;

  event LogNewPerson(address newPerson, string name);

  function addPerson (string _name) returns (bool added) {  
    person memory per;
    per.id = msg.sender;
    per.name = _name;
    p.push(per);
    LogNewPerson(msg.sender, _name);
    return true;
  }

  function getPerson (address a) constant returns (address d, string n) {  
    for (uint k = 0; k <= p.length; k++) {  
      if (p[k].id == a) {
        return(p[k].id, p[k].name);
      }
    }
  }
} 
