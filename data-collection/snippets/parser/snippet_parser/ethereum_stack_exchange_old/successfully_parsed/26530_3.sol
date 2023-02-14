contract Bar {

    Foo foo;

    function Bar(address _foo) public {
        foo = Foo(_foo);
    }

    function testFoo(uint amount) public view returns(uint number) {
        return (foo.a(amount));
    }

}
