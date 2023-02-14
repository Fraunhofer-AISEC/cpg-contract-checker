contract A { }
contract B { }
contract C is A, B { } 
contract D is C, A { } 
contract E is A, C { } 
