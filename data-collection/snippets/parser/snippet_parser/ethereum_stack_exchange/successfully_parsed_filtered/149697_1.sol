contract CExt is C { 
  constructor(uint value) C(value){}
}

contract CExtChild is CExt(1) { }
