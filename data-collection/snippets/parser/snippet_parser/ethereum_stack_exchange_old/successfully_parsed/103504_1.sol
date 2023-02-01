interface ICommon {
    function foo();
    function bar();
}

interface IContract1 is ICommon {
    function exclusiveMethod1();
}


interface IContract2 is ICommon {
    function exclusiveMethod2();
}
