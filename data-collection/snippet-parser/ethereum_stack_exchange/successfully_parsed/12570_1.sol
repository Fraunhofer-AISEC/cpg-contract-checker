pragma solidity ^0.4.8;

contract A {

  event LogNewStudent(address a);
  struct details { string name; uint roll ;} 
  mapping (address => details) public testMap;

  function set (string name, uint roll) {
    Student instance = new Student(name, roll);
    testMap[instance] = details(name,roll);
    LogNewStudent(instance);
  }

  function get (address a) 
    constant
    returns(string name, uint roll) 
  {
    
    return(testMap[a].name, testMap[a].roll);
  }
}


contract Student {   
  function Student(string name, uint roll) {}    
}
