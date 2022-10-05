contract House { 
  uint public idHouse;
  ...
}

contract ArrayHouse { 
  House[] public arrayHouse;

  function getHouse(uint n) returns(House){
    if (n >= arrayHouse.length) 
      throw;
    return arrayHouse[n];
  }
}
