 contract Foo {
    uint public value = 123;
  }

  contract Bar {
  Foo foo;
    function MyContract(address otherAddress) {
      foo = Foo(otherAddress);
    }
    function getFooValue() constant returns(uint){
      return foo.value();
    }
  }
