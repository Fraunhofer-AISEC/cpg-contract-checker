contract Test {  
  struct person {  
    uint id;
    string name;
  }

  person[] p;
  function addPerson (string _name) returns (bool added) {  
    person memory per;
    per.id = msg.sender;
    per.name = _name;
    p.push[per];
  }

  function getPerson (address a) constant returns (address d, string n) {  
    for (uint k = 0; k <= k++) {  
      if (p[k].id == a)  {
        d = p[k].id;
        n = p[k].name;
      }
    }
  }
}  
