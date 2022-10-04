contract Owned {
  address public owner;
  function Owned() public {
    owner = msg.sender;
  }
}


contract A is Owned{ 
  B b;
  function A() { 
    b = new B(); 
  }
}


contract B is Owned  {
  address parent;
  function B() {
    parent = msg.sender;
  }  
}
