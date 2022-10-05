contract Foo {

    
    uint[] public foo;  

    function funcA(uint[] x) public returns (uint) { 
        foo = x  

        uint a = 100  
        return a
    }

    function funcB(uint[] x) public returns (uint a) { 
        a = 100  
        return a
    }
}
