contract C { 
    function test() public { log0(0x1111); } 
}

contract B is C {
    function bbb() public { log0(0xbbbb); }
    function test() public {
       bbb(); 
       super.test(); 
    }
} 

contract A is B {
}
