contract Foo {

    struct Bar {
        address owner;
        uint[] x;
    }

    Bar[] public bars;

    function foobar(address a) public {
        Bar storage b = Bar(a, new uint[]) 
        bars.push(b)
    }

}
