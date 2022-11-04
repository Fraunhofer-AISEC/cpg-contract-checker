contract FooFactory {
    function createInstance(address[] memory _addrs) public {
        new Foo(_addrs);
    }
}
