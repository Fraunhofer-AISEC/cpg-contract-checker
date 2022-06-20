contract B { 
  function set() {} 
  function f() { 
    set(); 
  } 
}

contract A is B { 
   function set() { }
}
