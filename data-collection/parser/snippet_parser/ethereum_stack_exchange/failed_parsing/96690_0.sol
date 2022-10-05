contract Test {
    function test (bool isTransaction) public view {
        if (isTransaction) {
          foo();
        }

        ...
    }
    
    function foo () public {
        ...
    }
}
