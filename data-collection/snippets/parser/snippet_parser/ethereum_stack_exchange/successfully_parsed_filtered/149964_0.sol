contract Test {
    
    function() internal pure pFunc;

    function foo() internal pure { }

    function das() public {
        
        pFunc = foo;

        
        pFunc();

        
        delete pFunc;

        
        
        pFunc();
    }
}
