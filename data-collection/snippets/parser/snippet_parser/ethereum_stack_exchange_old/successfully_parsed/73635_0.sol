contract Bob {
    function foo() internal;
}


contract Mar is Bob {

    function vote() public {
        foo();
    }

    function foo() internal {
    }
}
