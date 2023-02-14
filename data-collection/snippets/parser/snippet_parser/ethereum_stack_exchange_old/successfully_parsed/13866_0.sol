contract demo {
  string public name = "someString"; 

  function returnValue() constant returns (string){ 
      return name;    
  }
}
