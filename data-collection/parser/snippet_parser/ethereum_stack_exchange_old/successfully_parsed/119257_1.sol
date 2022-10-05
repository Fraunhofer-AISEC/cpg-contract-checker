contract Sample {
  address owner;
  string name;

  function Sample() {
    owner = msg.sender;
  }

  function setName(string n) {
     if(msg.sender == owner) {
        name = n;
     }
  }
} 
