contract Foo {
    function Foo() {}

    function chop() public returns (bytes32)
    {
        return "Chop!!!";
    }
}

contract Bar {
    
    Foo public foo = new Foo(); 

    
    Foo public foo2 = Foo(0xF00BAA...); 

    
    address public hoo;

    
    function kungFoo(Foo sumFoo) internal {
        sumFoo.chop();
    }

    
    function kungHoo(address sumHoo) public {
        hoo = sumHoo;
        Foo(hoo).chop();
    }
}
