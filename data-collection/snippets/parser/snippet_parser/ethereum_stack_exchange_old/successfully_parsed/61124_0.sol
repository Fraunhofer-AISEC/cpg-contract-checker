interface I { }

contract A is I { }

contract B is A { }

contract C is A { }

contract D is B, C { }
