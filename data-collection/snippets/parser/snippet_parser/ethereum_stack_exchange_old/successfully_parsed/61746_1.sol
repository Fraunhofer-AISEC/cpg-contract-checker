contract C { 
    function test() public {  } 
}

contract B is C {
    function bbb() public {  }
    function test() public {
       bbb(); 
       super.test(); 
    }
} 

contract A is B {
    function bbb() public {  }
    function test() public {
       bbb(); 
       super.test(); 
    }
}
