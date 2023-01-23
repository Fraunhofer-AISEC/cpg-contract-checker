contract Factory {
  bytes32[] Names;
  address[] newContracts;

  function createContract (bytes32 name) {
      address newContract = new Contract(name);
      newContracts.push(newContract);
  } 

  function getName (uint i) {
      Contract con = Contract(newContracts[i]);
      Names[i] = con.Name();
  }
}

contract Contract {
  bytes32 public Name;
  string public numberString;

  function Contract (bytes32 name) {
      Name = name;
  }

  function setNumberString (string time){
      numberString = time;      
  }
}
